import 'package:flutter/material.dart';

import '../../constant/assets_path.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AssetsPath.logoImage),
      ),
    );
  }
}
