import 'package:flutter/material.dart';

import '../../constant/assets_path.dart';
import '../../widgets/custom_auth_textfield.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login";

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetsPath.authBackground), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomAuthTextField(
                  labelText: "Email",
                  textInputType: TextInputType.text,
                  obscureText: false,
                  controller: emailController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please enter your Email";
                    }
                    return null;
                  },
                ),
                CustomAuthTextField(
                  labelText: "Password",
                  textInputType: TextInputType.text,
                  obscureText: true,
                  controller: emailController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please enter your Password";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                    ),
                  ),
                  child: const Text(
                    "Log In",
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
