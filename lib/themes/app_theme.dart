import 'package:flutter/material.dart';
import 'package:newcity/themes/text_theme.dart';

import '../themes/colors.dart';
import 'radius.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blue, // You can choose your primary color
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      // Define global button themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderXlCircular,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        surfaceTintColor: whiteColor,
        color: whiteColor,
        iconTheme: const IconThemeData(color: blackColor),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: primaryColor,
        selectionColor: primaryColor.withOpacity(0.5),
        selectionHandleColor: primaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hoverColor: primaryColor,
        border: OutlineInputBorder(
          borderRadius: borderLgCircular,
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderLgCircular,
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderLgCircular,
          borderSide: BorderSide(color: primaryColor, width: 1),
        ),
        hintStyle: regularPrimaryColor14,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: blueColor, // Default text/icon color
          side: const BorderSide(
              color: blueColor, width: 2), // Border color and width
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      // You can also define themes for FloatingActionButton, IconButton, etc.
      // floatingActionButtonTheme: FloatingActionButtonThemeData(
      //   backgroundColor: Colors.blue,
      //   foregroundColor: Colors.white,
      // ),
    );
  }
}
