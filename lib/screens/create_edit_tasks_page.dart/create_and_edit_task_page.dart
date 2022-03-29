import 'package:flutter/material.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/widgets/create_and_edit_task_page_body.dart';

class CreateAndEditTasksPage extends StatefulWidget {
  const CreateAndEditTasksPage({Key? key}) : super(key: key);

  @override
  State<CreateAndEditTasksPage> createState() => _CreateAndEditTasksPageState();
}

class _CreateAndEditTasksPageState extends State<CreateAndEditTasksPage> {
  @override
  void initState() {
    //! buraya setdefultsetting gelecek global key singelton olarak yazılacak
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const CreateAndEditTaskPageBody(),
    );
  }
}
