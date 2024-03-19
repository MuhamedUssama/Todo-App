import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/list_tab/list_tab_screen.dart';
import 'package:todo_app/screens/home/setting_tab/setting_tab_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do List"),
      ),
      body: currentIndex == 0 ? const ListScreen() : const SettingScreen(),
      floatingActionButton: buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() => BottomAppBar(
        notchMargin: 10,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.list, size: 28), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings, size: 28), label: ""),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      );

  Widget buildFloatingActionButton() => FloatingActionButton(
        onPressed: () {},
        shape: const StadiumBorder(
          side: BorderSide(
            width: 4,
            color: Colors.white,
          ),
        ),
        child: const Icon(Icons.add),
      );
}
