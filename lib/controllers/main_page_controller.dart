import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/main_page_mod.dart';
import 'package:todo_app/core/enums/sort_task_by.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/sort_task_by_extensions.dart';

//! providerları geliştir
class MainPageController with ChangeNotifier {
  TaskSortingType sortTaskBy = TaskSortingType.deadline;
  MainPageMod mainPageMod = MainPageMod.listing;
  final List<Task> _tasks = [];
  final List<Task> selectedTasks = [];

  List<Task> get tasks => _tasks;
  List<Task> get taskListInSelectedOrder =>
      sortTaskBy.sortTaskList(taskList: _tasks);
  bool get isTaskCheckboxVisible => mainPageMod == MainPageMod.select;

  bool isCheckboxChecked(Task task) {
    return selectedTasks.contains(task);
  }

  void toggleTaskSortType() {
    //! bunu geliştir
    if (sortTaskBy == TaskSortingType.deadline) {
      sortTaskBy = TaskSortingType.importanceAndDeadline;
    } else {
      sortTaskBy = TaskSortingType.deadline;
    }
    notifyListeners();
  }
  
  //? bunları kullanmak mantıklı mı ?
  void addToTaskListWithNotifyListener({required Task newTask,required List<Task> tasklist}) {
    tasklist.add(newTask);
    notifyListeners();
  }
  
  //? bunları kullanmak mantıklı mı ?
  void removeFromTaskListWithNotifyListener({required Task newTask,required List<Task> tasklist}){
    tasklist.remove(newTask);
    notifyListeners();
  }
  

  void setMainPageMod(MainPageMod newMainPageMod) {
    mainPageMod = newMainPageMod;
    notifyListeners();
  }

  //? burası çok kötü oldu
  void editTask({
    required Task task,
    required Task newTask,
  }) {
    task.title = newTask.title;
    task.description = newTask.description;
    task.importanceLevel = newTask.importanceLevel;
    task.deadLine = newTask.deadLine;
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
