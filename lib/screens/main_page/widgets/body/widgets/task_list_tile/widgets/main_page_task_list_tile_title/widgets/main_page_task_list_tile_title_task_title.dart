import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/main_page_controller.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/helper/task_list_extensions.dart';

class MainPageTaskListTileTaskTitle extends StatelessWidget {
  const MainPageTaskListTileTaskTitle({
    Key? key,
    required this.taskId,
  }) : super(key: key);
  final String taskId;

  @override
  Widget build(BuildContext context) {
    return Selector<MainPageController, String>(
      selector: (BuildContext context, MainPageController mainPageController) {
        return mainPageController.tasks.findTaskById(taskId).title;
      },
      builder: (
        BuildContext context,
        taskTitle,
        Widget? child,
      ) {
        return Container(
          margin: EdgeInsets.only(left: context.width * 0.03),
          child: Text(
            taskTitle,
            style: TextStyle(fontSize: context.width * 0.045),
          ),
        );
      },
    );
  }
}
