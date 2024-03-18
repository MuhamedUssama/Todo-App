import 'package:flutter/material.dart';
import 'package:todo_app/screens/register/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../constant/assets_path.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_auth_textfield.dart';

// ignore: must_be_immutable
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
                  controller: passController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please enter your Password";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    loginAccount();
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Log In",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have account already?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RegisterScreen.routeName);
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginAccount() {
    if (formKey.currentState?.validate() == false) {
      return;
    }

    try {
      final result = FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
