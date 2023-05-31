import 'package:flutter/material.dart';

class CustomColor{
  static const blue = MaterialColor(
    0xFF146EB4,
    <int, Color>{
      50: Color(0xFF146EB4),
      100: Color(0xFF146EB4),
      200: Color(0xFF146EB4),
      300: Color(0xFF146EB4),
      400: Color(0xFF146EB4),
      500: Color(0xFF146EB4),
      600: Color(0xFF146EB4),
      700: Color(0xFF146EB4),
      800: Color(0xFF146EB4),
      900: Color(0xFF146EB4),
    },
  );

  static const black = MaterialColor(
    0xFF333333,
    <int, Color>{
      50: Color(0xFF333333),
      100: Color(0xFF333333),
      200: Color(0xFF333333),
      300: Color(0xFF333333),
      400: Color(0xFF333333),
      500: Color(0xFF333333),
      600: Color(0xFF333333),
      700: Color(0xFF333333),
      800: Color(0xFF333333),
      900: Color(0xFF333333),
    },
  );
}

bool isDarkMode = ThemeMode == (ThemeMode.dark) ? true : false;

void toggleTheme() {
  isDarkMode = !isDarkMode;
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: CustomColor.blue,
    brightness: Brightness.light,
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: CustomColor.black,
    brightness: Brightness.dark
  );
}
