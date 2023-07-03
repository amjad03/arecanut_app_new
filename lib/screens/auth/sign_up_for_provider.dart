import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/constants.dart';
import '../../constants/dimensions.dart';
import '../../repository/auth_repository.dart';
import '../../services/validation_service.dart';
import '../../widgets/custom_button.dart';

String gender = '';

class SignUpScreenForProvider extends StatefulWidget {
  const SignUpScreenForProvider({Key? key}) : super(key: key);

  @override
  State<SignUpScreenForProvider> createState() =>
      _SignUpScreenForProviderState();
}

class _SignUpScreenForProviderState extends State<SignUpScreenForProvider> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController machineCountController = TextEditingController();
  TextEditingController workersCountController = TextEditingController();

  bool isLoading = false;
  bool show = true;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    addressController.dispose();
    experienceController.dispose();
    machineCountController.dispose();
    workersCountController.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var bgColor = Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF333333)
        : Colors.white;
    bool isDark =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    var iconColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey
        : Colors.black45;

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(children: [
        SafeArea(
          child: SizedBox(
            width: double.maxFinite,
            child: Center(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                // width: Sizes.fiveHundred,
                width: 450,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.black38, blurRadius: 10)
                    ]),
                child: SingleChildScrollView(
                  child: Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.all(Dimensions.height20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Register as\nService Provider",
                            style: TextStyle(
                                fontSize: Dimensions.thirty,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter'),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          Divider(
                            indent: Dimensions.forty,
                            endIndent: Dimensions.forty,
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Name",
                                style: TextStyle(),
                              ),
                              SizedBox(
                                height: Dimensions.ten,
                              ),
                              TextFormField(
                                controller: nameController,
                                textAlign: TextAlign.start,
                                cursorColor: Colors.grey,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFEBEBEB),
                                  focusColor: Colors.grey,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.fifteen,
                                      vertical: Dimensions.ten),
                                  hintText: "Enter Your Name",
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(Dimensions.ten),
                                    borderSide: BorderSide.none,
                                  ),
                                  iconColor: iconColor,
                                  labelStyle: TextStyle(color: iconColor),
                                ),
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return "Name is Required";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Email(Optional)",
                                style: TextStyle(),
                              ),
                              SizedBox(
                                height: Dimensions.ten,
                              ),
                              TextFormField(
                                controller: emailController,
                                textAlign: TextAlign.start,
                                cursorColor: Colors.grey,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFEBEBEB),
                                  focusColor: Colors.grey,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.fifteen,
                                      vertical: Dimensions.ten),
                                  hintText: "Enter Your Email",
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(Dimensions.ten),
                                    borderSide: BorderSide.none,
                                  ),
                                  iconColor: iconColor,
                                  labelStyle: TextStyle(color: iconColor),
                                ),
                                // validator: (value) {
                                //   if(value == null || value.toString().isEmpty){
                                //     return "Email is required";
                                //   }
                                //   else if (!isEmail(value)) {
                                //     return "Please enter a valid email address";
                                //   }
                                //   else {
                                //     return null;
                                //   }
                                // },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Phone",
                                style: TextStyle(),
                              ),
                              SizedBox(
                                height: Dimensions.ten,
                              ),
                              TextFormField(
                                controller: phoneController,
                                textAlign: TextAlign.start,
                                cursorColor: Colors.grey,
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFEBEBEB),
                                  focusColor: Colors.grey,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.fifteen,
                                      vertical: Dimensions.ten),
                                  hintText: "Enter Your Phone",
                                  prefixIcon: const Icon(
                                    Icons.call,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(Dimensions.ten),
                                    borderSide: BorderSide.none,
                                  ),
                                  iconColor: iconColor,
                                  labelStyle: TextStyle(color: iconColor),
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      value.toString().isEmpty) {
                                    return "Phone Number is required";
                                  } else if (value.length < 10) {
                                    return "Phone number must be 10 digits";
                                  } else if (!value.isNumericOnly) {
                                    return "Please enter a valid phone number";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Password",
                                style: TextStyle(),
                              ),
                              SizedBox(
                                height: Dimensions.ten,
                              ),
                              TextFormField(
                                controller: passwordController,
                                textAlign: TextAlign.start,
                                cursorColor: Colors.grey,
                                obscureText: show,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFEBEBEB),
                                  focusColor: Colors.grey,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.fifteen,
                                      vertical: Dimensions.ten),
                                  hintText: "Enter Your Password",
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Colors.grey,
                                  ),
                                  suffixIcon: show
                                      ? IconButton(
                                          icon: const Icon(
                                            Icons.visibility,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              show = !show;
                                            });
                                          },
                                        )
                                      : IconButton(
                                          icon: const Icon(
                                            Icons.visibility_off,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              show = !show;
                                            });
                                          },
                                        ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(Dimensions.ten),
                                    borderSide: BorderSide.none,
                                  ),
                                  iconColor: iconColor,
                                  labelStyle: TextStyle(color: iconColor),
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      value.toString().isEmpty) {
                                    return "Password is required";
                                  } else if (value.length < 8) {
                                    return "Password must be at least 8 characters";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Address",
                                style: TextStyle(),
                              ),
                              SizedBox(
                                height: Dimensions.ten,
                              ),
                              TextFormField(
                                controller: addressController,
                                textAlign: TextAlign.start,
                                cursorColor: Colors.grey,
                                keyboardType: TextInputType.text,
                                maxLines: 4,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFEBEBEB),
                                  focusColor: Colors.grey,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.fifteen,
                                      vertical: Dimensions.ten),
                                  hintText: "Enter Full Address",
                                  prefixIcon: const Icon(
                                    Icons.location_on,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(Dimensions.ten),
                                    borderSide: BorderSide.none,
                                  ),
                                  iconColor: iconColor,
                                  labelStyle: TextStyle(color: iconColor),
                                ),
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return "Address is Required";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Experience (in years)",
                                style: TextStyle(),
                              ),
                              SizedBox(
                                height: Dimensions.ten,
                              ),
                              TextFormField(
                                controller: experienceController,
                                textAlign: TextAlign.start,
                                cursorColor: Colors.grey,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFEBEBEB),
                                  focusColor: Colors.grey,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.fifteen,
                                      vertical: Dimensions.ten),
                                  hintText: "Total Experience",
                                  prefixIcon: const Icon(
                                    Icons.work,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(Dimensions.ten),
                                    borderSide: BorderSide.none,
                                  ),
                                  iconColor: iconColor,
                                  labelStyle: TextStyle(color: iconColor),
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      value.toString().isEmpty) {
                                    return "Experience is required";
                                  } else if (!value.isNumericOnly) {
                                    return "Please enter a valid number";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Total Machines",
                                style: TextStyle(),
                              ),
                              SizedBox(
                                height: Dimensions.ten,
                              ),
                              TextFormField(
                                controller: machineCountController,
                                textAlign: TextAlign.start,
                                cursorColor: Colors.grey,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFEBEBEB),
                                  focusColor: Colors.grey,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.fifteen,
                                      vertical: Dimensions.ten),
                                  hintText: "Total Machines",
                                  prefixIcon: const Icon(
                                    Icons.widgets,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(Dimensions.ten),
                                    borderSide: BorderSide.none,
                                  ),
                                  iconColor: iconColor,
                                  labelStyle: TextStyle(color: iconColor),
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      value.toString().isEmpty) {
                                    return "This field is required";
                                  } else if (!value.isNumericOnly) {
                                    return "Please enter a valid number";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Total Workers",
                                style: TextStyle(),
                              ),
                              SizedBox(
                                height: Dimensions.ten,
                              ),
                              TextFormField(
                                controller: workersCountController,
                                textAlign: TextAlign.start,
                                cursorColor: Colors.grey,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFEBEBEB),
                                  focusColor: Colors.grey,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.fifteen,
                                      vertical: Dimensions.ten),
                                  hintText: "Total Workers",
                                  prefixIcon: const Icon(
                                    Icons.people,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(Dimensions.ten),
                                    borderSide: BorderSide.none,
                                  ),
                                  iconColor: iconColor,
                                  labelStyle: TextStyle(color: iconColor),
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      value.toString().isEmpty) {
                                    return "This field is required";
                                  } else if (!value.isNumericOnly) {
                                    return "Please enter a valid number";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: CustomButton(
                              title: "Register",
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  String? res =
                                      await signUpWithEmailAndPasswordForProvider(
                                          emailController.text.trim(),
                                          passwordController.text.trim(),
                                          nameController.text.trim(),
                                          context);
                                  if (res == 'true') {
                                    // addUserData(nameController.text.trim(), emailController.text.trim() ,phoneController.text.trim());
                                    addServiceProviderData(
                                        nameController.text,
                                        addressController.text,
                                        experienceController.text,
                                        machineCountController.text,
                                        workersCountController.text);
                                    storeUserRole("provider");
                                    moveToHomePageForProvider();
                                  }
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              },
                              fontSize: Dimensions.fifteen,
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Strings.alreadyHaveAccount,
                                style: TextStyle(
                                    fontSize: Dimensions.fifteen,
                                    color: AppColors.grey,
                                    fontFamily: 'Inter'),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    Strings.signIn,
                                    style: TextStyle(
                                        fontSize: Dimensions.fifteen,
                                        color: Colors.blue,
                                        fontFamily: 'Inter'),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (isLoading)
          const Opacity(
            opacity: 0.4,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (isLoading)
          const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
      ]),
    );
  }

  // void moveToHomePage() {
  //   Navigator.pushNamedAndRemoveUntil(context, "/main", (route) => false);
  // }

  void moveToHomePageForProvider() {
    Navigator.pushNamedAndRemoveUntil(
        context, "/mainForProvider", (route) => false);
  }

  void snackBar(res) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(res as String),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  _DropDownState() {
    gender = genderList[0];
  }

  // String gender = '';
  List genderList = ['Male', 'Female', 'Other'];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(Dimensions.radius5)),
      child: DropdownButtonFormField(
        value: gender,
        hint: const Text(
          'Select Gender',
          style: TextStyle(fontFamily: 'Inter'),
        ),
        onChanged: (value) {
          setState(() {
            gender = value!;
          });
        },
        items: genderList.map((e) {
          return DropdownMenuItem<String>(
            value: e,
            child: Text(
              e,
              style: const TextStyle(fontFamily: 'Inter'),
            ),
          );
        }).toList(),
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.male,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
