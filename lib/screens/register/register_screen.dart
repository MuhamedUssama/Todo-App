import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/screens/login/login_screen.dart';
import 'package:todo_app/utils/app_colors.dart';

import '../../constant/assets_path.dart';
import '../../constant/firebase_error_strings.dart';
import '../../utils/dialog_utils.dart';
import '../../widgets/custom_auth_textfield.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "register";

  RegisterScreen({super.key});

  final TextEditingController fullNameController =
      TextEditingController(text: "mohamed");

  final TextEditingController userNameController =
      TextEditingController(text: "mohamed");

  final TextEditingController emailController =
      TextEditingController(text: "mohamed3@gmail.com");

  final TextEditingController passwordController =
      TextEditingController(text: "123456");

  final TextEditingController passwordConfigController =
      TextEditingController(text: "123456");

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetsPath.authBackground), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomAuthTextField(
                      labelText: "Full Name",
                      controller: fullNameController,
                      textInputType: TextInputType.name,
                      obscureText: false,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please enter your full name.";
                        }
                        return null;
                      },
                    ),
                    CustomAuthTextField(
                      labelText: "User Name",
                      controller: userNameController,
                      textInputType: TextInputType.text,
                      obscureText: false,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please enter your user name.";
                        }
                        return null;
                      },
                    ),
                    CustomAuthTextField(
                      labelText: "Email",
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
                      obscureText: false,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please enter your email.";
                        }
                        return null;
                      },
                    ),
                    CustomAuthTextField(
                      labelText: "Password",
                      controller: passwordController,
                      textInputType: TextInputType.text,
                      obscureText: true,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please enter password";
                        }
                        if (text.length < 6) {
                          return "Please enter at least 6 characters for the password.";
                        }
                        return null;
                      },
                    ),
                    CustomAuthTextField(
                      labelText: "Password Configration",
                      controller: passwordConfigController,
                      textInputType: TextInputType.text,
                      obscureText: true,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please fill the password configration field.";
                        }
                        if (text != passwordController.text) {
                          return "The password configuration does not match the password.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        signUpAccount(context);
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 14),
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.routeName);
                          },
                          child: const Text(
                            "Log in",
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
        ),
      ),
    );
  }

  void signUpAccount(BuildContext context) async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      DialogUtils.showDialogUtils(
          context: context,
          title: "Registed Successfully",
          content:
              "Welcome Sir, Please fill the blanks in the login page and enjoy in our application",
          textButton: "Ok",
          function: () {
            Navigator.pushReplacementNamed(context, LoginScreen.routeName);
          });

      print(result.user?.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == ErrorStrings.weakPassword) {
        DialogUtils.showDialogUtils(
            context: context,
            title: "Error",
            content: "The password provided is too weak.",
            textButton: "Close",
            function: () {
              Navigator.pop(context);
            });
        print('The password provided is too weak.');
      } else if (e.code == ErrorStrings.emailInUse) {
        DialogUtils.showDialogUtils(
            context: context,
            title: "Error",
            content: "The account already exists for that email.",
            textButton: "Close",
            function: () {
              Navigator.pop(context);
            });

        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
