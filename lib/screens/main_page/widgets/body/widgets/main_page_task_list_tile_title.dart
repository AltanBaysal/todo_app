import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/todo_state.dart';
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
    //? bunu parçalamama gerek var mı ?
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Visibility(
              visible: Provider.of<TodoState>(context).checkboxVisibilityToggle,
              child: Checkbox(
                value: Provider.of<TodoState>(context).isCheckboxChecked(task),
                onChanged: (bool? isChecked) => Provider.of<TodoState>(context,listen: false)
                    .selectedTaskListAddRemoveTaskToggle(task),
              ),
            ),

            SvgCoveredSizedBox(
              height: context.height * 0.05,
              width: context.height * 0.05,
              svgAssets:task.svg,
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
