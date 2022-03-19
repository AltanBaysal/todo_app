import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/duration_extensions.dart';
import 'package:todo_app/screens/helper/importance_level_enum_extensions.dart';

class MainPageTaskListTileChild extends StatelessWidget {
  const MainPageTaskListTileChild({
    Key? key,
    required this.task,
  }) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //! tasarımını baştan yap
        Text(
          "${EnglishTexts.importanceLevel} : ${task.importanceLevel.getImportanceLevelText}",
          softWrap: true,
          style: TextStyle(fontSize: width * 0.04),
        ),

        Text(
          "${EnglishTexts.creationDate} : ${task.creationDate.toString().substring(0, 16)}",
          softWrap: true,
          style: TextStyle(fontSize: width * 0.04),
        ),

        Text(
          "${EnglishTexts.deadline} : ${task.deadLine.toString().substring(0, 16)}",
          softWrap: true,
          style: TextStyle(fontSize: width * 0.04),
        ),

        Text(
          "${EnglishTexts.totalTaskDuration} : ${task.taskTotalDuration.convertDurationToText}",
          softWrap: true,
          style: TextStyle(fontSize: width * 0.04),
        ),

        Text(
          "${EnglishTexts.remainDuration} : ${task.remainDuration.convertDurationToText}",
          softWrap: true,
          style: TextStyle(fontSize: width * 0.04),
        ),
        
        Text(
          "${EnglishTexts.description} : ${task.description}",
          softWrap: true,
          style: TextStyle(fontSize: width * 0.04),
        ),
      ],
    );
  }
}
