import 'package:todo_app/core/enums/sort_task_by.dart';

String mainPageAppBarLeadingText(TaskSortingType taskSortingType){
  switch (taskSortingType) {
    case TaskSortingType.deadline: return "In Time"; //yazıları const'a al
    case TaskSortingType.importanceAndDeadline : return "In Importance";
  }
}