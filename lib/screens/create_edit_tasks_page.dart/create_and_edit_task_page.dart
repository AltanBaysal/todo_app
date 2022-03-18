import 'package:flutter/material.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/widgets/create_and_edit_task_page_body.dart';

class CreateAndEditTasksPage extends StatelessWidget {
  const CreateAndEditTasksPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const CreateAndEditTaskPageBody(),
    );
  }
}
