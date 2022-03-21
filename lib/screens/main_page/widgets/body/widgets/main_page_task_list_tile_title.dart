import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/todo_state.dart';
import 'package:todo_app/core/shared_widgets/svg_covered_sized_box.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/duration_extensions.dart';
import 'package:todo_app/screens/helper/importance_level_enum_extensions.dart';

class MainPageTaskListTileTitle extends StatelessWidget {
  const MainPageTaskListTileTitle({
    Key? key,
    required this.task,
  }) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    //? bunu parçalamama gerek var mı ?
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Consumer<TodoState>(
              builder: (BuildContext context, value,Widget? child) => Visibility(
                visible: value.checkboxVisibilityToggle,
                child: Checkbox(
                  value: value.isCheckboxChecked(task),
                  onChanged: (bool? isChecked) => value.selectedTaskListAddRemoveTaskToggle(task),
                ),
              ),
            ),

            SvgCoveredSizedBox(
              height: height * 0.05,
              width: height * 0.05,
              svgAssets: task.importanceLevel.importanceLevelSvg,
            ),

            Container(
              margin: EdgeInsets.only(left: width * 0.03),
              child: Text(
                task.title,
                style: TextStyle(fontSize: width * 0.045),
              ),
            ),
          ],
        ),

        Container(
          margin: EdgeInsets.only(left: width * 0.02),
          child: Text(
            task.remainDuration.convertDurationToText,
          ),
        ),
      ],
    );
  }
}
