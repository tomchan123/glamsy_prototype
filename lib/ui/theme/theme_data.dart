import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get mainTheme {
    return ThemeData(
      primaryColor: const Color.fromARGB(255, 212,162,94),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      // cardColor: Colors.white, 
      scaffoldBackgroundColor: const Color.fromARGB(255, 0xF5, 0xF5, 0xF5),
      textTheme: const TextTheme(
        labelSmall: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 1
        ),
        labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        displayMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        )
      ),
      colorScheme: const ColorScheme.light(
        background: Colors.white,
        shadow: Colors.black12,
        primary: Color(0xffd4a25e),
        onPrimary: Colors.white,
        secondary: Color(0xffbb8a7d),
        surface: Color(0xfff1f1f1),
      ),
      iconTheme: IconThemeData(
        size: 22,
        weight: 600,
      ),
      hintColor: Color(0xff9e9e9e),
    );
  }
}