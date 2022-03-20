import 'package:todo_app/core/enums/sort_task_by.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/task_list_extensions.dart';

extension SortTaskByExtensions on SortTaskBy{
  List<Task> sortTaskList({required List<Task> taskList}){
    switch (this){
      case SortTaskBy.importanceAndDeadline : return taskList.taskListInImportanceLevelAndTimeOrder;
      case SortTaskBy.deadline : return taskList.getTaskListByTimeOrder;
    }
  }
}