import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get mainTheme {
    return ThemeData(
      primaryColor: const Color.fromARGB(255, 0xE3, 0xB6, 0x7D),
      cardColor: Colors.white, 
      scaffoldBackgroundColor: const Color.fromARGB(255, 0xF6, 0xF6, 0xF6),
      textTheme: const TextTheme(
        labelSmall: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 14,
        )
      )
    );
  }
}