import 'package:flutter/material.dart';
import 'package:news_app/theming/colors.dart';

class MyThemeData
{
  static TextStyle titleMedium = TextStyle(
    fontWeight:FontWeight.w400,
    fontSize: 22,
    color: AppColors.white
  );
  static TextStyle titleLarge = TextStyle(
      fontWeight:FontWeight.w700,
      fontSize: 24,
      color: AppColors.white
  );
  static TextStyle bodyMedium = TextStyle(
      fontWeight:FontWeight.w700,
      fontSize: 14,
      color: AppColors.black
  );
  static TextStyle bodySmall = TextStyle(
      fontWeight:FontWeight.w400,
      fontSize: 14,
      color: AppColors.green
  );
  static ThemeData lightTheme = ThemeData(
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.white),

    appBarTheme:  AppBarTheme(
      backgroundColor: AppColors.green,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50))),),
  );
}