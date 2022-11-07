import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keeper/Service/constance.dart';

class MyTheme extends GetxController {
  RxBool isDarkMode = false.obs;

  ThemeMode getThemeMode() {
    return isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
  }

  ThemeData ligthTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: primarySwatchColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: kassentColor, foregroundColor: kprimaryColor),
  );

  ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      // primarySwatch: primaryDarkModeColor,
      // colorScheme: const ColorScheme.dark()
      );
}
