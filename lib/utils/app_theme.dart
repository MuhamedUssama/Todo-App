import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_colors.dart';

abstract class AppTheme {
  static ThemeData lightThemeData = ThemeData(
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primaryColor,
      secondary: Colors.white,
      tertiary: Colors.black,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.black),
      bodySmall: TextStyle(color: AppColors.primaryColor),
    ),
    primaryColor: AppColors.primaryColor,
    unselectedWidgetColor: const Color(0XFFA9A9A9).withOpacity(0.9),
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: AppColors.bottomSheetLight),
    scaffoldBackgroundColor: AppColors.laightScaffoldBackgroundColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      backgroundColor: AppColors.primaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColor,
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
    ),
  );

  static ThemeData darkThemeData = ThemeData(
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primaryColor,
      secondary: Colors.white,
      tertiary: AppColors.darkUnSelectedIconNavigationBar,
    ),
    textTheme: TextTheme(
      bodyLarge: const TextStyle(color: AppColors.darkScaffoldBackgroundColor),
      bodyMedium: const TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: const Color(0XFFCDCACA).withOpacity(0.9)),
    ),
    primaryColor: AppColors.primaryColor,
    unselectedWidgetColor: const Color(0XFFCDCACA).withOpacity(0.9),
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: AppColors.bottomSheetdark),
    scaffoldBackgroundColor: AppColors.darkScaffoldBackgroundColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Color(0XFF060E1E),
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      backgroundColor: AppColors.primaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: Color(0XFFC8C9CB),
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
      color: Color(0XFF141922),
    ),
  );
}
