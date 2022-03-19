import 'package:flutter/material.dart';
import 'package:todo_app/screens/main_page/widgets/main_page_body.dart';
import 'package:todo_app/screens/main_page/widgets/main_page_floating_action_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        centerTitle: true,
      ),
      floatingActionButton: const MainPageFloatingActionButton(),
      body: const MainPageBody(),
    );
  }
}

