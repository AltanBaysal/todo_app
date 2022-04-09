import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/main_page_controller.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/task_list_extensions.dart';


class MainPageTaskCheckbox extends StatelessWidget {
  const MainPageTaskCheckbox({
    Key? key,
    required this.taskId,
  }) : super(key: key);
  final String taskId;

  @override
  Widget build(BuildContext context) {
    return Selector<MainPageController, bool>(
      selector: (
        BuildContext context,
        MainPageController mainPageController,
      ) {
        return mainPageController.isTaskCheckboxVisible;
      },
      builder: (
        BuildContext context,
        bool isTaskCheckboxVisible,
        Widget? child,
      ) {
        return Visibility(
          visible: isTaskCheckboxVisible,
          child: Consumer<MainPageController>(
            builder: (
              BuildContext context,
              MainPageController value,
              Widget? child,
            ) {
              Task task = value.tasks.findTaskById(taskId);
              return Checkbox(
                value: value.isCheckboxChecked(task),
                onChanged: (bool? isChecked) {
                  if (isChecked == true) {
                    value.addToTaskListWithNotifyListener(
                        newTask: task, tasklist: value.selectedTasks);
                  } else {
                    value.removeFromTaskListWithNotifyListener(
                        newTask: task, tasklist: value.selectedTasks);
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
