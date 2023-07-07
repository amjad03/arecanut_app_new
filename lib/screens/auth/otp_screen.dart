import 'package:arecanut_app/screens/auth/sign_in.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../constants/dimensions.dart';
import '../../repository/auth_repository.dart';
import '../../services/validation_service.dart';
import '../../widgets/custom_input.dart';
import '../../widgets/custom_button.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // bool sent = false;
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bgColor = Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF333333)
        : Colors.white;
    // var color = Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.white;
    bool isDark =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    var iconColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey
        : Colors.black45;

    var bg = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey.shade700
        : Colors.grey.shade200;

    var color = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey.shade800
        : Colors.grey.shade300;

    Future<void> popScreen() async {
      Navigator.of(context).pop();
    }

    // void showSuccessDialog(BuildContext context) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: const Text('Successful!'),
    //         content: Text(
    //             "We have sent you a password reset link to ${emailController.text},\ncheck your email inbox.(if not found then check your spam folder)"),
    //         actions: [
    //           TextButton(
    //             onPressed: () {
    //               Navigator.pop(context); // Close the dialog
    //               // Navigator.popUntil(
    //               //     context,
    //               //     ModalRoute.withName(
    //               //         '/signIn')
    //               // ); // Pop until the '/signIn' route
    //             },
    //             child: Text('OK'),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }

    return Scaffold(
      backgroundColor: bgColor,
      // appBar: AppBar(
      //   elevation: 0,
      // ),
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
                    color: bg,
                    boxShadow: const [
                      BoxShadow(color: Colors.black38, blurRadius: 10)
                    ]),
                child: SingleChildScrollView(
                  child: Container(
                    width: double.maxFinite,
                    // height: Dimensions.sixFifty,
                    height: 500,
                    // decoration: BoxDecoration(
                    //   color: Colors.white,
                    //   boxShadow: [
                    //     BoxShadow(
                    //       color: Colors.black38,
                    //       blurRadius: Dimensions.five
                    //     )
                    //   ]
                    // ),
                    margin: EdgeInsets.only(
                        left: Dimensions.height20,
                        right: Dimensions.height20,
                        bottom: Dimensions.height20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Image(image: isDark
                          //     ? AssetImage(Images.forgotPassImageDark)
                          //     : AssetImage(Images.forgotPassImageLight)
                          // ),
                          // Align(
                          //     alignment: Alignment.centerRight,
                          //     child: IconButton(
                          //       icon: const Icon(Icons.close),
                          //       onPressed: () {
                          //         Navigator.pop(context);
                          //       },
                          //     )),
                          Text(
                            "Enter OTP",
                            style: TextStyle(
                                fontSize: Dimensions.twenty,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter'),
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
                                "OTP",
                                style: TextStyle(),
                              ),
                              SizedBox(
                                height: Dimensions.ten,
                              ),
                              TextFormField(
                                controller: otpController,
                                textAlign: TextAlign.start,
                                cursorColor: Colors.grey,
                                // obscureText: show,
                                keyboardType: TextInputType.number,
                                // maxLines: widget.maxLines,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: color,
                                  focusColor: Colors.grey,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.fifteen,
                                      vertical: Dimensions.ten),
                                  hintText: "Enter the OTP",
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
                                validator: (value) {
                                  if (value == null ||
                                      value.toString().isEmpty) {
                                    return "OTP is required";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ],
                          ),
                          // CustomInputField(controller: emailController, icon: Icons.email, label: "Enter Your Registered Email", password: false, phoneNumber: false,maxLines: 1, isFor: 'Email',),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: CustomButton(
                              title: "Send Reset Link",
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  // Future.delayed(
                                  //   const Duration(seconds: 2),
                                  //   () => sendResetPasswordLink(
                                  //       emailController.text.trim()),
                                  // );
                                  // String? res = await sendResetPasswordLink(
                                  //     emailController.text.trim());
                                  //
                                  // if (res == 'true') {
                                  //   showSuccessDialog(context);
                                  //   Future.delayed(Duration(seconds: 1),
                                  //       () => Navigator.pop(context));
                                  // }
                                  code(otpController.text);
                                  setState(() {
                                    isLoading = false;
                                  });
                                  // setState(() {
                                  //   sent = !sent;
                                  // });
                                }
                              },
                              fontSize: Dimensions.fifteen,
                            ),
                          ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // TextButton(
                          //     onPressed: () {
                          //       Navigator.pop(context);
                          //     },
                          //     child: const Text(
                          //       "<<Go back",
                          //       style: TextStyle(fontSize: 20),
                          //     ))
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
}
