import 'package:flutter/material.dart';
import 'package:todo_app/widgets/custom_text_field.dart';

class AddTaskBottomSheet extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16), // Set the border radius
      clipBehavior:
          Clip.antiAlias, // Ensure contents are clipped to the rounded border
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).bottomSheetTheme.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add New Task",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium!.color,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            CustomTextFormField(
              labelText: "Enter your task title",
              controller: titleController,
              textInputType: TextInputType.text,
              validator: (text) {},
            ),
            const SizedBox(height: 12),
            CustomTextFormField(
              labelText: "Add your task description",
              controller: descriptionController,
              textInputType: TextInputType.text,
              validator: (text) {},
              maxLines: 20,
            ),
            const SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Select Time",
                  style: TextStyle(
                    color: Theme.of(context).unselectedWidgetColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 64),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              child: const Text("Add Task"),
            )
          ],
        ),
      ),
    );
  }
}
