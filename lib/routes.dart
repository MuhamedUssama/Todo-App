import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/home.dart';
import 'package:todo_app/screens/splash/splash.dart';

abstract class AppRouter {
  static const String initialRoute = SplashScreen.routeName;

  static Map<String, Widget Function(BuildContext)> appRoutes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    HomeScreen.routeName: (context) => const HomeScreen(),
  };
}
