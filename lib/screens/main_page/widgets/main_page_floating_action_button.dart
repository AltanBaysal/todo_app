import 'package:flutter/material.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/create_and_edit_task_page.dart';

class MainPageFloatingActionButton extends StatelessWidget {
  const MainPageFloatingActionButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CreateAndEditTasksPage(),
          ),
        );
      },
    );
  }
}