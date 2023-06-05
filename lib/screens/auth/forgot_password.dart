import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../constants/dimensions.dart';
import '../../repository/auth_repository.dart';
import '../../services/validation_service.dart';
import '../../widgets/custom_input.dart';
import '../../widgets/custom_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool sent = false;
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
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

    return Scaffold(
      backgroundColor: bgColor,
      // appBar: AppBar(
      //   elevation: 0,
      // ),
      body: Stack(children: [
        SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              height: Dimensions.sixFifty,
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
              child: sent
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // SizedBox(height: Dimensions.height20,),
                        // SizedBox(
                        //   width: Dimensions.hundred,
                        //   child: Image(image: AssetImage(
                        //       Images.success
                        //   )),
                        // ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        Text(
                          "We have sent you a password reset link to ${emailController.text},\ncheck your email inbox.(if not found then check your spam folder)",
                          style: TextStyle(
                              fontSize: Dimensions.twenty,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Inter'),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: Dimensions.height40,
                        ),
                        // TextFormField(
                        //   controller: emailController,
                        //   textAlign: TextAlign.start,
                        //   cursorColor: Colors.grey,
                        //   // obscureText: show,
                        //   keyboardType: TextInputType.text,
                        //   // maxLines: widget.maxLines,
                        //   decoration: InputDecoration(
                        //     filled: true,
                        //     fillColor: Color(0xFFEBEBEB),
                        //     focusColor: Colors.grey,
                        //     contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.fifteen, vertical: Dimensions.ten),
                        //     label: Text(""),
                        //     prefixIcon: Icon(
                        //       Icons.email,
                        //       color: Colors.grey,
                        //     ),
                        //     // suffixIcon: widget.password
                        //     //     ? show
                        //     //     ? IconButton(
                        //     //   icon: const Icon(
                        //     //     Icons.visibility,
                        //     //     color: Colors.grey,
                        //     //   ),
                        //     //   onPressed: () {
                        //     //     setState(() {
                        //     //       show = !show;
                        //     //     });
                        //     //   },
                        //     // )
                        //     //     : IconButton(
                        //     //   icon: const Icon(
                        //     //     Icons.visibility_off,
                        //     //     color: Colors.grey,
                        //     //   ),
                        //     //   onPressed: () {
                        //     //     setState(() {
                        //     //       show = !show;
                        //     //     });
                        //     //   },
                        //     // )
                        //     //     : null,
                        //     border: InputBorder.none,
                        //     iconColor: iconColor,
                        //     labelStyle: TextStyle(color: iconColor),
                        //   ),
                        //   validator: (value) {
                        //     if (value == null || !isEmail(value)) {
                        //       return "Please enter a valid email address";
                        //     }
                        //     else {
                        //       return null;
                        //     }
                        //   },
                        // ),
                        // CustomInputField(controller: emailController, icon: Icons.email, label: "Enter Your Registered Email", password: false, phoneNumber: false,maxLines: 1, isFor: 'Email',),
                        // SizedBox(height: Dimensions.height20,),
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            title: "OK",
                            onPressed: () {
                              setState(() {
                                sent = !sent;
                              });
                              Navigator.of(context).pop();
                            },
                            fontSize: Dimensions.fifteen,
                          ),
                        ),
                      ],
                    )
                  : Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Image(image: isDark
                          //     ? AssetImage(Images.forgotPassImageDark)
                          //     : AssetImage(Images.forgotPassImageLight)
                          // ),
                          Text(
                            Strings.forgotPass,
                            style: TextStyle(
                                fontSize: Dimensions.twenty,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter'),
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          // Divider(indent: Dimensions.forty, endIndent: Dimensions.forty,),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          Text(
                            "Don’t Worry Write Your Registered email below",
                            style: TextStyle(
                                fontSize: Dimensions.fifteen,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter'),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: Dimensions.height40,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(),
                              ),
                              SizedBox(
                                height: Dimensions.ten,
                              ),
                              TextFormField(
                                controller: emailController,
                                textAlign: TextAlign.start,
                                cursorColor: Colors.grey,
                                // obscureText: show,
                                keyboardType: TextInputType.text,
                                // maxLines: widget.maxLines,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFFEBEBEB),
                                  focusColor: Colors.grey,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.fifteen,
                                      vertical: Dimensions.ten),
                                  hintText: "Enter Your Registered Email",
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.grey,
                                  ),
                                  // suffixIcon: widget.password
                                  //     ? show
                                  //     ? IconButton(
                                  //   icon: const Icon(
                                  //     Icons.visibility,
                                  //     color: Colors.grey,
                                  //   ),
                                  //   onPressed: () {
                                  //     setState(() {
                                  //       show = !show;
                                  //     });
                                  //   },
                                  // )
                                  //     : IconButton(
                                  //   icon: const Icon(
                                  //     Icons.visibility_off,
                                  //     color: Colors.grey,
                                  //   ),
                                  //   onPressed: () {
                                  //     setState(() {
                                  //       show = !show;
                                  //     });
                                  //   },
                                  // )
                                  //     : null,
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
                                    return "Email is required";
                                  } else if (!isEmail(value)) {
                                    return "Please enter a valid email address";
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
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    sent = !sent;
                                  });
                                  setState(() {
                                    isLoading = true;
                                  });
                                  sendResetPasswordLink(
                                      emailController.text.trim());
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              },
                              fontSize: Dimensions.fifteen,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("<<Go back"))
                        ],
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
