import 'package:flutter/material.dart';
import 'package:todo_app/core/services/global_build_context_services.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/widgets/create_and_edit_task_page_body.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';

class CreateAndEditTasksPage extends StatefulWidget {
  const CreateAndEditTasksPage({
    Key? key,
    this.task,
  }) : super(key: key);

  final Task? task;

  @override
  State<CreateAndEditTasksPage> createState() => _CreateAndEditTasksPageState();
}

class _CreateAndEditTasksPageState extends State<CreateAndEditTasksPage> {
  @override
  void initState() {
    GlobalBuildContextService().globalBuildContext.providerOfCreateAndEditTaskController.setPageSetting(task: widget.task);
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
