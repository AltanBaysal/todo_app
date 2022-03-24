import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/create_and_edit_task_controller.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/create_and_edit_task_page.dart';

class MainPageFloatingActionButton extends StatelessWidget {
  const MainPageFloatingActionButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {  
        Provider.of<CreateAndEditTaskController>(context,listen: false).setDefaultSettings(); //? buraya yazmak mantıklı mı
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