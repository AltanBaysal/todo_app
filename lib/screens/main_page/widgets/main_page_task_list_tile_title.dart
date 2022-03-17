import 'package:flutter/material.dart';
import 'package:todo_app/core/shared_widgets/svg_covered_sized_box.dart';
import 'package:todo_app/models/goal.dart';
import 'package:todo_app/screens/helper/duration_text_converter_extension.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgCoveredSizedBox(
              height: height * 0.05,
              width: height * 0.05,
              svgAssets: task.importanceLevel.getImportanceLevelSvg,
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