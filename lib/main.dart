import 'package:flutter/material.dart';
import 'package:mercury_2/app.dart';
import 'package:mercury_2/themes/theme_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp()
    )
  );
}

