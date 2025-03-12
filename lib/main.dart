import 'package:flutter/material.dart';
import 'package:keeper/core/router/app_router.dart';
import 'package:keeper/core/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Keeper',
      routerConfig: AppRouter.router,
      theme: AppThemeData.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
