import 'package:flutter/material.dart';

typedef Validator = Function(String?);

class CustomAuthTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final Validator validator;
  final TextInputType textInputType;
  final bool obscureText;
  const CustomAuthTextField({
    super.key,
    required this.labelText,
    this.controller,
    required this.validator,
    required this.textInputType,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      validator: (text) {
        return validator(text);
      },
      decoration: InputDecoration(labelText: labelText),
    );
  }
}
