import 'package:flutter/material.dart';
import 'package:newcity/theme/colors.dart';

class AppTextTheme {
  static final TextTheme lightTextTheme = TextTheme(
    headlineLarge:
        TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: text),
    bodyLarge: TextStyle(fontSize: 16, color: text),
  );

  static final TextTheme darkTextTheme = TextTheme(
    headlineLarge:
        TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: whiteColor),
    bodyLarge: TextStyle(fontSize: 16, color: whiteColor),
  );
}
