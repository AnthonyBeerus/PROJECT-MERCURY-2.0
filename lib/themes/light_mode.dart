import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme.light(
    background: Color(0xFFEBEDEB),
    primary: Color(0xFFE63946),
    secondary: Color(0xFFF8FAF8),
    tertiary: Color(0xFFDFE0DF),
    onBackground: Color(0xFF151515),
    error: Color(0xffE6BE39),
    primaryContainer: Color(0xff39E662),
    inversePrimary: Color(0xff3950E6)
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFF171717),
    ),
    displayMedium: TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFF171717),
    ),
    displaySmall: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFF171717),
    ),
    labelSmall: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFF171717),
    ),
  )
);
