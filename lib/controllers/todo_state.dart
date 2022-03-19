import 'package:flutter/material.dart';
import 'package:todo_app/screens/helper/task_list_extensions.dart';
import '../models/task.dart';

class TodoState with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addNewTaskToList({required Task newTask}) {
    tasks.add(newTask);
    notifyListeners();
  }

  List<Task> get tasksInTimeOrder => _tasks.putTasksInTimeOrder;
}
