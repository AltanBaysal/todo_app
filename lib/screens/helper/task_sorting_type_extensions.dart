import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/core/enums/sort_task_by.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/task_list_extensions.dart';

extension TaskSortingTypeExtensions on TaskSortingType{
  List<Task> sortTaskList({required List<Task> taskList}){
    switch (this){
      case TaskSortingType.importanceAndDeadline : return taskList.inImportanceLevelAndTimeOrderEndWithAchievedTask;
      case TaskSortingType.deadline : return taskList.inTimeOrderEndWithAchievedTask;
    }
  }

  String get text{
    switch (this) {
      case TaskSortingType.deadline: return EnglishTexts.deadline;
      case TaskSortingType.importanceAndDeadline: return EnglishTexts.importance;
    }
  }
}