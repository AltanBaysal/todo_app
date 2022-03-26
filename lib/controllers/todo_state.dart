import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/main_page_mod.dart';
import 'package:todo_app/core/enums/sort_task_by.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/sort_task_by_extensions.dart';

class MainPageController with ChangeNotifier {
  TaskSortingType sortTaskBy = TaskSortingType.deadline;
  MainPageMod mainPageMod = MainPageMod.listing;

  final List<Task> _tasks = [];
  final List<Task> selectedTasks = [];

  List<Task> get tasks => _tasks;

  List<Task> get taskListInSelectedOrder =>
      sortTaskBy.sortTaskList(taskList: _tasks);

  bool get isTaskCheckboxVisible {
    return mainPageMod == MainPageMod.select;
  }

  bool isCheckboxChecked(Task task) => selectedTasks.contains(task);

  void toggleTaskSortType() {
    //! bunu geliştir
    if (sortTaskBy == TaskSortingType.deadline) {
      sortTaskBy = TaskSortingType.importanceAndDeadline;
    } else {
      sortTaskBy = TaskSortingType.deadline;
    }
    notifyListeners();
  }

  void addNewTaskToList(Task newTask) {
    _tasks.add(newTask);
    notifyListeners();
  }

  void setMainPageMod(MainPageMod newMainPageMod) {
    mainPageMod = newMainPageMod;
    notifyListeners();
  }

  void editTask({
    required Task task,
    required Task newTask,
  }) {
    task = newTask;
    notifyListeners();
  }

  void deleteSelectedTasks() {
    _tasks.removeWhere(
      (task) => selectedTasks.contains(task),
    );
  }

  void achieveSelectedTasks() {
    for (var task in selectedTasks) {
      task.setCompleted();
    }
  }
}
