import 'package:flutter/material.dart';

class AppColor {
  AppColor._();
  static const primaryColor = Color(0xff7F3DFF);
  static const secondry = Color(0xffEEE5FF);
  static const white = Colors.white;
  static const black = Colors.black;
}

class AppThemeData {
  AppThemeData._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        foregroundColor: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    ),
  );
}
