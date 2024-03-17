import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_colors.dart';

abstract class AppTheme {
  static ThemeData lightThemeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.laightScaffoldBackgroundColor,
  );

  static ThemeData darkThemeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.darkScaffoldBackgroundColor,
  );
}
