import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/home.dart';
import 'package:todo_app/screens/login/login_screen.dart';
import 'package:todo_app/screens/register/register_screen.dart';
import 'package:todo_app/screens/splash/splash.dart';

abstract class AppRouter {
  static const String initialRoute = RegisterScreen.routeName;

  static Map<String, Widget Function(BuildContext)> appRoutes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    HomeScreen.routeName: (context) => const HomeScreen(),
    RegisterScreen.routeName: (context) => RegisterScreen(),
    LoginScreen.routeName: (context) => LoginScreen(),
  };
}
