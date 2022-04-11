import 'package:flutter/material.dart';
import 'package:todo_app/core/shared_widgets/custom_icon_button.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/create_and_edit_task_page.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/helper/task_list_extensions.dart';

class MainPageTaskListTileChildEditButton extends StatelessWidget {
  const MainPageTaskListTileChildEditButton({
    Key? key,
    required this.taskId,
  }) : super(key: key);
  final String taskId;

  @override
  Widget build(BuildContext context) {
    Task task = context.providerOfMainPageController.tasks.findTaskById(taskId);
    return Visibility(
      visible: !task.isCompleted,
      child: CustomIconButton(
        icon: Icons.edit,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateAndEditTasksPage(
                task: task,
              ),
            ),
          );
        },
      ),
    );
  }
}
