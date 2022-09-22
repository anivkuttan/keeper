import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTheme extends GetxController {
  RxBool isDarkMode = false.obs;

  ThemeMode getThemeMode() {
    return isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
  }

  ThemeData ligthTheme = ThemeData(
    brightness: Brightness.light,
  );

  ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
}
