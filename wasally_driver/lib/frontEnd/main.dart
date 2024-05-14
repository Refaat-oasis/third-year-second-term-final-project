import 'package:flutter/material.dart';
import 'package:wasaalydriver/frontEnd/components/theme.dart';
import 'package:wasaalydriver/frontEnd/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        darkTheme: darkMode,
        themeMode: ThemeMode.light,
        home: const SplashScreen());
  }
}
