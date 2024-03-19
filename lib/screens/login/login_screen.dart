import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/auth_provider.dart';
import 'package:todo_app/screens/register/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../constant/assets_path.dart';
import '../../utils/app_colors.dart';
import '../../utils/dialog_utils.dart';
import '../../widgets/custom_auth_textfield.dart';
import '../home/home.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login";

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final formKey = GlobalKey<FormState>();

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
                    loginAccount(context);
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

  void loginAccount(BuildContext context) async {
    if (formKey.currentState?.validate() == false) {
      return;
    }

    var authProvider = Provider.of<AuthProviderClass>(context, listen: false);

    try {
      await authProvider.login(emailController.text, passController.text);

      DialogUtils.showDialogUtils(
          context: context,
          title: "Logged In Successfully",
          content: "Welcome Sir, Enjoy in your journey ^^",
          textButton: "Go",
          function: () {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        DialogUtils.showDialogUtils(
            context: context,
            title: "Error",
            content: "No user found for that email.",
            textButton: "Close",
            function: () {
              Navigator.pop(context);
            });
      } else if (e.code == 'wrong-password') {
        DialogUtils.showDialogUtils(
            context: context,
            title: "Error",
            content: 'Wrong password provided for that user.',
            textButton: "Close",
            function: () {
              Navigator.pop(context);
            });
      }
    } catch (e) {
      DialogUtils.showDialogUtils(
          context: context,
          title: "Error",
          content: "$e",
          textButton: "Close",
          function: () {
            Navigator.pop(context);
          });
    }
  }
}
