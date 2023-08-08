import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: black,
    scaffoldBackgroundColor: black,
    fontFamily: 'Montserrat',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: white,
        fontWeight: FontWeight.w800,
      ),
      headlineMedium: TextStyle(
        color: white,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        color: white,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: white,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: white,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: white,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        color: white,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: white,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: white,
        fontWeight: FontWeight.w300,
      ),
      labelLarge: TextStyle(
        color: white,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        color: white,
        fontWeight: FontWeight.w300,
      ),
      labelSmall: TextStyle(
        color: white,
        fontWeight: FontWeight.w200,
      ),
    ),
    useMaterial3: true,
  );

  static const Color black = Color.fromRGBO(0, 0, 0, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color blue = Color.fromRGBO(57, 92, 187, 1);
  static const Color darkGreen = Color.fromRGBO(115, 159, 19, 1);
  static const Color darkRed = Color.fromRGBO(195, 69, 70, 1);
  static const Color purple = Color.fromRGBO(145, 70, 255, 1);

  static const Color red = Colors.redAccent;
  static const Color pink = Colors.pinkAccent;
  static const Color yellow = Colors.yellowAccent;
  static const Color green = Colors.greenAccent;
}
