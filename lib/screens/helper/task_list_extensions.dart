import 'package:todo_app/core/enums/importance_level_enum.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/get_importance_level_values_in_importance_order.dart';

extension TaskListExtensions on List<Task> {  

  List<Task> get taskListInImportanceLevelAndTimeOrder{
    List<Task> newList = [];
    for (var item in getImportanceLevelValuesInImportanceOrder()) {
      newList += getTaskListByImportanceLevel(importanceLevel: item).getTaskListByTimeOrder;
    }
    return newList;
  }
   
  List<Task> get getTaskListByTimeOrder{
    List<Task> newList = this;
    newList.sort((Task firstTask,Task secondTask){
      return firstTask.deadLine.compareTo(secondTask.deadLine);
    });
    return newList;
  }

  List<Task> get achievedTasksInTimeOrder{
    return where((element) => element.isCompleted == true).toList().getTaskListByTimeOrder;
  }
  
  List<Task> get achievedTasksInImportanceLevelOrder{
    return where((element) => element.isCompleted == true).toList().taskListInImportanceLevelAndTimeOrder;
  }
  
  List<Task> getTaskListByImportanceLevel({required ImportanceLevel importanceLevel}) {
    List<Task> newList = [];
    for (var element in this) {
      if(element.importanceLevel == importanceLevel){
        newList.add(element);
      }
    }
    return newList;
  }
} 