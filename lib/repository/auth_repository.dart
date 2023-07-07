import 'package:arecanut_app/screens/tabs/home_page/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../constants/dimensions.dart';
import '../widgets/show_message.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void updateUserData(name, email, phone) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setString('name', name);
  prefs.setString('email', email);

  _auth.currentUser?.updateDisplayName(name);
  _auth.currentUser?.updateEmail(email);
  _auth.currentUser?.updatePhoneNumber(phone);
  showToast("Profile Updated Successfully");
}

void updateName(name) {
  _auth.currentUser?.updateDisplayName(name);
  showToast("Your Name is Successfully Updated as $name");
}

void updateEmail(email) {
  _auth.currentUser?.updateEmail(email);
  showToast("Your Email is Successfully Updated as $email");
}

void updatePhone(phone) {
  _auth.currentUser?.updatePhoneNumber(phone);
  showToast("Your Phone is Successfully Updated as $phone");
}

void updatePassword(password) {
  _auth.currentUser?.updatePhoneNumber(password);
  showToast("Your Password is Successfully Updated");
}

// void moveToHomePage(context) {
//   Navigator.pushNamedAndRemoveUntil(context, "/main", (route) => false);
// }

Future<String?> signUpWithEmailAndPassword(
    String email, String password, String name, context) async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;

    await user?.updateDisplayName(name);
    showToast(" Registered Successfully");
    return 'true';
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      showToast("The password provided is too weak.");
    } else if (e.code == 'email-already-in-use') {
      showToast("The account already exists for that email.");
    }
  } catch (e) {
    showToast("An error occurred while signing up.");
  }
  return null;
}

var smsCode = '';

void code(code) {
  smsCode = code;
}

//432094
void verifyPhoneNumber(
    String phoneNumber, BuildContext context, name, phone) async {
  TextEditingController codeController = TextEditingController();

  await _auth.verifyPhoneNumber(
    phoneNumber: "+91 $phoneNumber",
    verificationCompleted: (PhoneAuthCredential credential) async {
      // Auto-verification has occurred (e.g., the device auto-received the SMS code)
      // You can sign in the user by calling signInWithCredential()
      await _auth.signInWithCredential(credential);
    },
    verificationFailed: (FirebaseAuthException e) {
      // Handle verification failure
      showToast("Verification Failed");
      if (kDebugMode) {
        print(e.message);
      }
    },
    // codeSent: (String verificationId, int? resendToken) {
    //   // Save the verification ID and use it to build a credential
    //   // This is needed to manually enter the verification code
    //   // String smsCode = ''; // Enter the verification code manually
    //
    //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //       verificationId: verificationId, smsCode: smsCode);
    //   // Use the credential to sign in the user
    //   _signInWithCredential(credential);
    // },
    codeSent: (String verificationId, int? forceResendingToken) {
      //show dialog to take input from the user
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
                title: const Text("Enter SMS Code"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // TextField(
                    //   controller: codeController,
                    // ),
                    TextFormField(
                      controller: codeController,
                      textAlign: TextAlign.start,
                      cursorColor: Colors.grey,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.grey.shade800
                                : Colors.grey.shade300,
                        focusColor: Colors.grey,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: Dimensions.fifteen,
                            vertical: Dimensions.ten),
                        hintText: "Enter OTP",
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Dimensions.ten),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.toString().isEmpty) {
                          return "OTP is required";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text("Done"),
                    onPressed: () {
                      FirebaseAuth auth = FirebaseAuth.instance;

                      smsCode = codeController.text.trim();

                      final credential = PhoneAuthProvider.credential(
                          verificationId: verificationId, smsCode: smsCode);
                      auth.signInWithCredential(credential).then((result) {
                        addUserNameAndPhone(name, phone);
                        storeUserRole("user");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      });
                    },
                  )
                ],
              ));
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      // Timeout occurred while waiting for the SMS code
      // Handle the timeout
    },
  );
}

void _signInWithCredential(PhoneAuthCredential credential) async {
  try {
    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    // Handle successful sign-in
    final User? user = userCredential.user;
    showToast("Successfully Signed in");

    // Navigator.pushNamedAndRemoveUntil(
    //     context, "/mainForUser", (route) => false);

    if (kDebugMode) {
      print('Signed in with phone number: ${user?.phoneNumber}');
    }
  } catch (e) {
    // Handle sign-in errors
    if (kDebugMode) {
      print(e.toString());
    }
  }
}

Future<String?> signInWithEmailAndPassword(
    String email, String password) async {
  try {
    var userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;

    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();

    if (snapshot.exists) {
      // var data = snapshot.data();
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
      if (data != null && data.containsKey('role')) {
        var role = data['role'] as String;
        if (role == "user") {
          // loginAsUser();
          return 'user';
        } else if (role == "provider") {
          // loginAsProvider();
          return 'provider';
        }
      }
    }
    showToast("LoggedIn Successfully");
    // return 'true';
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      showToast("No user found for that email.");
    } else if (e.code == 'wrong-password') {
      showToast("Wrong password provided for that user.");
    }
  } catch (e) {
    showToast("An error occurred while signing in.");
  }
  return null;
}

///////////////////////////////////////////////////////////////
Future<String?> signUpWithEmailAndPasswordForProvider(
    email, password, name, context) async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;

    await user?.updateDisplayName(name);
    showToast(" Registered Successfully");
    return 'true';
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      showToast("The password provided is too weak.");
    } else if (e.code == 'email-already-in-use') {
      showToast("The account already exists for that email.");
    }
  } catch (e) {
    showToast("An error occurred while signing up.");
  }
  return null;
}

void storeUserRole(String role) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('role', role);
}

Future<String> getUserRole() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userRole = prefs.getString('role');
  return userRole ?? ''; // Return an empty string if the value is null
}

void addUserData(name, email, phone) async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  // prefs.setString('name', name);
  // prefs.setString('email', email);

  final user = FirebaseAuth.instance.currentUser;
  final userId = user?.uid;
  if (kDebugMode) {
    print(userId);
  }

  final userRef = FirebaseFirestore.instance.collection('users');

  final userData = {
    'name': name,
    'email': email,
    'phone': phone,
    'role': "user"
  };

  await userRef.doc(userId).set(userData);
}

void addUserNameAndPhone(name, phone) async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  // prefs.setString('name', name);
  // prefs.setString('email', email);

  final user = FirebaseAuth.instance.currentUser;
  final userId = user?.uid;
  if (kDebugMode) {
    print(userId);
  }

  final userRef = FirebaseFirestore.instance.collection('users');

  final userData = {
    'name': name,
    'email': "none",
    'phone': phone,
    'role': "user"
  };

  await userRef.doc(userId).set(userData);
}

void addServiceProviderData(
  name,
  address,
  experience,
  machines,
  workers,
) async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  // prefs.setString('name', name);
  // prefs.setString('email', email);

  final user = FirebaseAuth.instance.currentUser;
  final userId = user?.uid;
  if (kDebugMode) {
    print(userId);
  }

  final userRef = FirebaseFirestore.instance.collection('users');

  final userData = {
    'serviceProviderId': userId,
    'serviceProviderName': name,
    'serviceProviderAddress': address,
    'experience': experience,
    'totalMachines': machines,
    'workers': workers,
    'overallRating': 5.0,
    'totalRatings': 0,
    'role': "provider"
  };

  await userRef.doc(userId).set(userData);
}

bool checkLoggedIn() {
  final user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    return true;
  } else {
    return false;
  }
}

Future<String> sendResetPasswordLink(email) async {
  try {
    await _auth.sendPasswordResetEmail(email: email);
    // showToast('Password reset link sent');
    return 'true';
  } on FirebaseAuthException catch (e) {
    if (e.code == 'invalid-email') {
      showToast('Invalid email address');
      return 'false';
    } else if (e.code == 'user-not-found') {
      showToast('User not found');
      return 'false';
    } else {
      showToast('Failed to reset password: ${e.code}');
      return 'false';
    }
    // Handle error and display a message to the user
  } catch (e) {
    showToast('Failed to reset password: $e');
    return 'false';
    // Handle error and display a message to the user
  }
  // return 'false';
  // await _auth.sendPasswordResetEmail(email: email);
  // showToast('Password reset link sent');
}

void logOut() async {
  await _auth.signOut();
}

Future<Map<String, String>> getUserData() async {
  // var name = '';
  // var email = '';

  final User? currentUser = FirebaseAuth.instance.currentUser;
  final String uid = currentUser?.uid ?? '';

  final DocumentReference userRef =
      FirebaseFirestore.instance.collection('users').doc(uid);

  try {
    final DocumentSnapshot userSnapshot = await userRef.get();
    if (userSnapshot.exists) {
      final userData = userSnapshot.data() as Map<String, dynamic>;
      final String name = userData['name'] ?? '';
      final String email = userData['email'] ?? '';
      // Do something with the retrieved user data
      // name = nameTemp;
      // email = emailTemp;
      return {
        'name': name,
        'email': email,
      };
      if (kDebugMode) {
        print('Name: $name');
      }
      if (kDebugMode) {
        print('Email: $email');
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error retrieving user data: ${e.toString()}');
    }
  }

  return {};
}
