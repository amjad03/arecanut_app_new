import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/dimensions.dart';
import '../main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).brightness == Brightness.dark ? const Color(0xFF272727) : Colors.grey.shade700;

    return Scaffold(
      body: Container(
        color: color,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: Dimensions.oneFifty,
              height: Dimensions.oneFifty,
              child: Image(image: AssetImage(
                  Images.logo
              )),
            ),
            // SizedBox(height: Dimensions.hundred,),
            // Text(Strings.app_title,style: TextStyle(fontSize: Dimensions.twenty,fontFamily: 'Inter'),)
          ],
        ),
      ),
    );
  }


}
