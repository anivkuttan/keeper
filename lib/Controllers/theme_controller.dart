import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keeper/Service/constance.dart';

class MyTheme extends GetxController {
  RxBool isDarkMode = false.obs;

  ThemeMode getThemeMode() {
    return isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
  }

  ThemeData ligthTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.light,
    
    ),
    scaffoldBackgroundColor: colorWhite,
  );

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    // colorScheme: const ColorScheme.dark(),
  );
}
