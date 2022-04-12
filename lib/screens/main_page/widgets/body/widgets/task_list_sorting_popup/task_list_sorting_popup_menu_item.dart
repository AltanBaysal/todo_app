import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/sort_task_by.dart';
import 'package:todo_app/screens/helper/task_sorting_type_extensions.dart';

class TaskListSortingPopupMenuItem extends StatelessWidget {
  const TaskListSortingPopupMenuItem(
      {Key? key, required this.taskSortingType})
      : super(key: key);
  final TaskSortingType taskSortingType;

  @override
  Widget build(BuildContext context) {
    return Text(taskSortingType.text);
  }
}
