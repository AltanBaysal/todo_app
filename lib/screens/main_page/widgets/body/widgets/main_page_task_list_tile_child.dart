import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/create_and_edit_task_controller.dart';
import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/core/shared_widgets/icon_covered_gesture_detector.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/create_and_edit_task_page.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //! tasarımını baştan yap
        Text(
          "${EnglishTexts.importanceLevel} : ${task.importanceLevel.importanceLevelText}",
          style: TextStyle(fontSize: context.width * 0.04),
        ),

        Text(
          "${EnglishTexts.creationDate} : ${task.creationDate.toString().substring(0, 16)}",
          style: TextStyle(fontSize: context.width * 0.04),
        ),

        Text(
          "${EnglishTexts.deadline} : ${task.deadLine.toString().substring(0, 16)}",
          style: TextStyle(fontSize: context.width * 0.04),
        ),

        Text(
          "${EnglishTexts.totalTaskDuration} : ${task.taskTotalDuration.convertDurationToText}",
          style: TextStyle(fontSize: context.width * 0.04),
        ),

        Text(
          "${EnglishTexts.remainDuration} : ${task.remainDuration.convertDurationToText}",
          style: TextStyle(fontSize: context.width * 0.04),
        ),

        Text(
          "${EnglishTexts.description} : ${task.description}",
          style: TextStyle(fontSize: context.width * 0.04),
        ),

        CustomIconButton(
          icon: Icons.edit,
          onTap: () {
            Provider.of<CreateAndEditTaskController>(context, listen: false)
              ..setDefaultSettings()
              ..setPageSettingsForEdit(task: task);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateAndEditTasksPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}
