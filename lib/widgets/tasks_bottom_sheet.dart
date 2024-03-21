import 'package:flutter/material.dart';
import 'package:todo_app/widgets/custom_text_field.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final DateTime selectedDate = DateTime.now();

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
        child: Form(
          key: formKey,
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
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return 'Please enter task title';
                  }
                },
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                labelText: "Add your task description",
                controller: descriptionController,
                textInputType: TextInputType.text,
                maxLines: 20,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return 'Task must have a description';
                  }
                },
              ),
              const SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Text(
                      selectedDateToRetturn == null
                          ? "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"
                          : "${selectedDateToRetturn!.day}/${selectedDateToRetturn!.month}/${selectedDateToRetturn!.year}",
                      style: TextStyle(
                        color: Theme.of(context).unselectedWidgetColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      showTaskDatePicker();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 64),
              ElevatedButton(
                onPressed: () {
                  addTask();
                },
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
      ),
    );
  }

  void addTask() {
    if (formKey.currentState!.validate() == false) {
      return;
    }
  }

  DateTime? selectedDateToRetturn;

  void showTaskDatePicker() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDateToRetturn ?? selectedDate,
      firstDate: selectedDate,
      lastDate: selectedDate.add(const Duration(days: 365)),
    );

    setState(() {
      selectedDateToRetturn = date;
    });
  }
}
