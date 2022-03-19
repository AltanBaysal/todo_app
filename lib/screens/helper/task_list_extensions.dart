import 'package:todo_app/core/enums/importance_level_enum.dart';
import 'package:todo_app/models/task.dart';

extension TaskListExtensions on List<Task> {

  Task findTaskById({required String id}){
    return firstWhere((element) => element.id == id);
  }

  List<Task> byimportanceLevel({required ImportanceLevel importanceLevel}) {
    List<Task> newList = [];
    for (var element in this) {
      if(element.importanceLevel == importanceLevel){
        newList.add(element);
      }
    }
    return newList;
  }

  List<Task> get putTasksInTimeOrder{
    List<Task> newList = this;
    newList.sort((a,b){
      return a.deadLine.compareTo(b.deadLine);
    });
    return newList;
  }
}