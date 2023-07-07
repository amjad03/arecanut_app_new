import 'package:flutter/material.dart';
import 'package:arecanut_app/constants/dimensions.dart';

import '../constants/constants.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.fontSize})
      : super(key: key);
  final VoidCallback onPressed;
  final String title;
  final double fontSize;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          // backgroundColor: Colors.blue,
          backgroundColor: AppColors.blue,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(Dimensions.ten), // Add border radius here
          ),
          padding: EdgeInsets.symmetric(vertical: Dimensions.fifteen)),
      onPressed: widget.onPressed,
      child: Text(
        widget.title,
        style: TextStyle(
            fontSize: widget.fontSize,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400),
      ),
    );
  }
}

class CustomOutlineButton extends StatefulWidget {
  const CustomOutlineButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.fontSize})
      : super(key: key);
  final VoidCallback onPressed;
  final String title;
  final double fontSize;

  @override
  State<CustomOutlineButton> createState() => _CustomOutlineButtonState();
}

class _CustomOutlineButtonState extends State<CustomOutlineButton> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).brightness == Brightness.dark
        ? Colors.transparent
        : Colors.white;

    final txtColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;

    final border = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey
        : Color(0xFF146EB4);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.ten),
              side: BorderSide(color: border)),
          padding: EdgeInsets.symmetric(vertical: Dimensions.fifteen)),
      onPressed: widget.onPressed,
      child: Text(
        widget.title,
        style: TextStyle(
            color: txtColor,
            fontSize: widget.fontSize,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400),
      ),
    );
  }
}

ElevatedButton customRoundedButton(
  String text,
  IconData icon, {
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            icon,
            size: 18,
            color: Colors.white,
          )
        ],
      ));
}
