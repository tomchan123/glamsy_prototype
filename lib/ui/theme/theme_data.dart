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
          fontWeight: FontWeight.w300,
          fontSize: 14,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
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
        )
      ),
      colorScheme: const ColorScheme.light(
        background: Colors.white,
        shadow: Colors.black12,
        primary: Color.fromARGB(255, 212, 162, 94),
        onPrimary: Colors.white,
        secondary: Color.fromARGB(255, 187, 138, 125),
      ),
      iconTheme: IconThemeData(
        size: 22,
        weight: 600,
      ),
      hintColor: Color(0xff9e9e9e),
    );
  }
}