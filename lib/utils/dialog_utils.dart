import 'package:flutter/material.dart';

class DialogUtils {
  static void showDialogUtils({
    required BuildContext context,
    required String title,
    required String content,
    required Function function,
    required String textButton,
    String? textButton2,
    Function? function2,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        contentPadding: const EdgeInsets.all(22),
        actions: [
          TextButton(
            onPressed: () {
              function();
            },
            child: Text(textButton),
          ),
          Visibility(
            visible: textButton2 == null ? false : true,
            child: TextButton(
              onPressed: () {
                function2!();
              },
              child: Text(textButton2 ?? ''),
            ),
          )
        ],
      ),
    );
  }
}
