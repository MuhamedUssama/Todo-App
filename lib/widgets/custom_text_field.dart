import 'package:flutter/material.dart';

typedef Validator = Function(String?);

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final int minLines;
  final int? maxLines;
  final TextEditingController? controller;
  final Validator validator;
  final TextInputType textInputType;
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.controller,
    required this.validator,
    required this.textInputType,
    this.minLines = 1,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Theme.of(context).unselectedWidgetColor,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).unselectedWidgetColor),
        ),
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: textInputType,
      validator: (text) {
        return validator(text);
      },
    );
  }
}
