import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/main_page_controller.dart';
import 'package:todo_app/core/services/global_build_context_services.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/helper/duration_extensions.dart';
import 'package:todo_app/screens/helper/task_list_extensions.dart';

class MainPageTaskListTileTitleTaskRemainTimeIndicator extends StatelessWidget {
  const MainPageTaskListTileTitleTaskRemainTimeIndicator({
    Key? key,
    required this.taskId,
  }) : super(key: key);
  final String taskId;

  @override
  Widget build(BuildContext context) {
    Task task = context.providerOfMainPageController.tasks.findTaskById(taskId);
    return Container(
      margin: EdgeInsets.only(left: context.width * 0.02),
      child: task.isCompleted
          ? const Text("Completed")
          : Selector<MainPageController, Duration>(
              selector: (
                BuildContext context,
                MainPageController mainPageController,
              ) {
                return task.remainDuration;
              },
              builder: (
                BuildContext context,
                duration,
                Widget? child,
              ) {
                return Text(duration.text);
              },
            ),
    );
  }
}
