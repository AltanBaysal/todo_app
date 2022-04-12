import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/sort_task_by.dart';
import 'package:todo_app/screens/helper/task_sorting_type_extensions.dart';

class TaskListViewSortingPopupMenuItem extends StatelessWidget {
  const TaskListViewSortingPopupMenuItem(
      {Key? key, required this.taskSortingType})
      : super(key: key);
  final TaskSortingType taskSortingType;

  @override
  Widget build(BuildContext context) {
    return Text(taskSortingType.text);
  }
}
