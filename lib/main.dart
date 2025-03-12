import 'package:flutter/material.dart';
import 'package:keeper/core/theme/theme.dart';
import 'package:keeper/pages/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keeper',
      theme: AppThemeData.lightTheme,
      home: const SignUpScreen(),
      // home: const OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
