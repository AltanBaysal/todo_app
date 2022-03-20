import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/sort_task_by.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/sort_task_by_extensions.dart';


class TodoState with ChangeNotifier {
  SortTaskBy sortTaskBy = SortTaskBy.importanceAndDeadline;
  final List<Task> _tasks = [];
  //! iserasermod bool değil enum;
  bool isEraseModOn = false;
  List<Task> get tasks => _tasks;

  //? isimlendirmeler tam olmadı gibi enum'ın falan
  List<Task> get taskListInOrder => sortTaskBy.sortTaskList(taskList: _tasks);

 
  void addNewTaskToList({required Task newTask}) {
    tasks.add(newTask);
    notifyListeners();
  }
  //? bunları servicese koymamı ister misin ?
  void removeTask({required Task task}) {
    _tasks.remove(task);
    notifyListeners();
  }
}
