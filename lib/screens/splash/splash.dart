import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/auth_provider.dart';
import 'package:todo_app/screens/home/home.dart';
import 'package:todo_app/screens/login/login_screen.dart';

import '../../constant/assets_path.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      navigate(context);
    });

    return Scaffold(
      body: Center(
        child: Image.asset(AssetsPath.logoImage),
      ),
    );
  }

  void navigate(BuildContext context) async {
    var authProvider = Provider.of<AuthProviderClass>(context, listen: false);

    if (authProvider.isUserLoggedInBefore()) {
      await authProvider.retriveUserFromDatabase();
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } else {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
  }
}
