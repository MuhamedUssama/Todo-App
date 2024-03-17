import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDFECDB),
      body: Center(
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
