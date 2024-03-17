import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: const ColorScheme.dark(
    background: Color(0xFF151515),
    primary: Color(0xFFE63946),
    //primary: Color(0xFFDF5657),
    secondary: Color(0xFF2d2c2c),
    tertiary: Color(0xFF464645),
    onBackground: Color(0xFFF8FAF8),
    error: Color(0xffE6BE39),
    primaryContainer: Color(0xff39E662),
    inversePrimary: Color(0xff3950E6),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFFF8FAF8),
    ),
    displayMedium: TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFFF8FAF8),
    ),
    displaySmall: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFFF8FAF8),
    ),
    labelSmall: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFFF8FAF8),
    ),
  )
);
