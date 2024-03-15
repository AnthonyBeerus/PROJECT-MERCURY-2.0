import 'package:flutter/material.dart';
import 'package:mercury_2/screens/home/views/home_screen.dart';
import 'package:mercury_2/themes/dark_mode.dart';
import 'package:mercury_2/themes/light_mode.dart';
import 'package:mercury_2/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightMode,
          darkTheme: darkMode,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}