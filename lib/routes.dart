import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/home.dart';
import 'package:todo_app/screens/home/list_tab/list_tab_screen.dart';
import 'package:todo_app/screens/home/setting_tab/setting_tab_screen.dart';
import 'package:todo_app/screens/login/login_screen.dart';
import 'package:todo_app/screens/register/register_screen.dart';
import 'package:todo_app/screens/splash/splash.dart';

abstract class AppRouter {
  static const String initialRoute = HomeScreen.routeName;

  static Map<String, Widget Function(BuildContext)> appRoutes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    RegisterScreen.routeName: (context) => RegisterScreen(),
    LoginScreen.routeName: (context) => LoginScreen(),
    HomeScreen.routeName: (context) => const HomeScreen(),
    ListScreen.routeName: (context) => const ListScreen(),
    SettingScreen.routeName: (context) => const SettingScreen(),
  };
}
