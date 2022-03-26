import 'package:todo_app/core/enums/importance_level_enum.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/get_importance_level_values_in_importance_order.dart';

extension TaskListExtensions on List<Task> {  
  List<Task> get inTimeOrderEndWithAchievedTask{
    List<Task> achievedTaskList = achievedTasks.inTimeOrder;
    return inTimeOrder.withoutAchievedTask + achievedTaskList ;
  }

  List<Task> get inImportanceLevelAndTimeOrderEndWithAchievedTask{
    List<Task> achievedTaskList = achievedTasks.inImportanceLevelAndTimeOrder;
    return inImportanceLevelAndTimeOrder.withoutAchievedTask + achievedTaskList;
  }

  List<Task> get withoutAchievedTask{
    return where((task) => !task.isCompleted).toList();
  }

  List<Task> get inImportanceLevelAndTimeOrder{
    //! bunu geliştir
    List<Task> newList = [];
    for (var item in importanceLevelValuesInImportanceOrder) {
      newList += getTaskListByImportanceLevel(importanceLevel: item).inTimeOrder;
    }
    return newList;
  }
   
  List<Task> get inTimeOrder{
    List<Task> newList = this;
    newList.sort((Task firstTask,Task secondTask){
      return firstTask.deadLine.compareTo(secondTask.deadLine);
    });
    return newList;
  }

  List<Task> get achievedTasks{
    return where((element) => element.isCompleted).toList();
  }
  
  List<Task> getTaskListByImportanceLevel({required ImportanceLevel importanceLevel}) {
    return where((task) => task.importanceLevel == importanceLevel).toList();
  }
  
} 