import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/main_page_controller.dart';
import 'package:todo_app/core/shared_widgets/svg_covered_sized_box.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/helper/duration_extensions.dart';
import 'package:todo_app/screens/helper/task_extension.dart';

class MainPageTaskListTileTitle extends StatelessWidget {
  const MainPageTaskListTileTitle({
    Key? key,
    required this.task,
  }) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    //! value yi dışardan al
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Consumer<MainPageController>(
              builder: (
                BuildContext context,
                value,
                Widget? child,
              ) {
                return Visibility(
                  visible: value.isTaskCheckboxVisible,
                  child: Checkbox(
                    value: value.isCheckboxChecked(task),
                    onChanged: (bool? isChecked) {
                      if (isChecked == true) {
                        //?bura güzel olmadı
                        value.addToTaskListWithNotifyListener(newTask: task, tasklist: value.selectedTasks);
                      } else {
                        value.removeFromTaskListWithNotifyListener(newTask: task, tasklist: value.selectedTasks);
                      }
                    },
                  ),
                );
              },
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
