import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/core/theme/theme.dart';
import 'package:keeper/pages/on_boarding_screen.dart';
import 'package:keeper/pages/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'onboarding',
          builder: (context, state) => const OnBoardingScreen(),
        ),
        GoRoute(
          path: '/signup',
          name: 'signup',
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => const SignUpScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Keeper',
      routerConfig: router,
      theme: AppThemeData.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
