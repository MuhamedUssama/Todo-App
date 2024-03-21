import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/database/tasks_dao.dart';
import 'package:todo_app/providers/auth_provider.dart';
import 'package:todo_app/screens/home/list_tab/task_widget.dart';

class ListScreen extends StatelessWidget {
  static const String routeName = "list";
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProviderClass>(context);
    return Column(
      children: [
        Expanded(
          child: StreamBuilder(
            stream: TaskDao.listenAllTasks(authProvider.userDatabase?.id ?? ""),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Loding Data
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                );
              }
              if (snapshot.hasError) {
                // Error Occured
                return const Center(child: Text("An error occured!"));
              }
              // Bahwl El docs of querySnapShots le list
              // var taskList =
              //     snapshot.data!.docs.map((obj) => obj.data()).toList();

              // aw ahwlha henak w atb3ha hena 3la tuul
              var taskList = snapshot.data;

              return ListView.builder(
                  itemBuilder: (context, index) {
                    return TaskWidget(
                      task: taskList[index],
                    );
                  },
                  itemCount: taskList!.length);
            },
          ),
        ),
      ],
    );
  }
}
