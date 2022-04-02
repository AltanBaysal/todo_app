import 'package:flutter/material.dart';
import 'package:todo_app/controllers/main_page_controller.dart';
import 'package:todo_app/core/shared_widgets/svg_covered_sized_box.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/helper/duration_extensions.dart';
import 'package:todo_app/screens/helper/task_extension.dart';

class MainPageTaskListTileTitle extends StatelessWidget {
  const MainPageTaskListTileTitle(
      {Key? key, required this.task, required this.value})
      : super(key: key);

  final Task task;
  final MainPageController value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Visibility(
              visible: value.isTaskCheckboxVisible,
              child: Checkbox(
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
              ),
            ),

            SvgCoveredSizedBox(
              height: context.height * 0.05,
              width: context.height * 0.05,
              svgAssets: task.svg,
            ),

            Container(
              margin: EdgeInsets.only(left: context.width * 0.03),
              child: Text(
                task.title,
                style: TextStyle(fontSize: context.width * 0.045),
              ),
            ),
          ],
        ),

        Container(
          margin: EdgeInsets.only(left: context.width * 0.02),
          child: Text(
            task.remainDuration.convertDurationToText,
          ),
        ),
      ],
    );
  }
}
