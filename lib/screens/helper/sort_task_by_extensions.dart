import 'package:todo_app/core/enums/sort_task_by.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/task_list_extensions.dart';

extension SortTaskByExtensions on TaskSortingType{
  List<Task> sortTaskList({required List<Task> taskList}){
    switch (this){
      case TaskSortingType.importanceAndDeadline : return taskList.inImportanceLevelAndTimeOrderEndWithAchievedTask;
      case TaskSortingType.deadline : return taskList.inTimeOrderEndWithAchievedTask;
    }
  }
}