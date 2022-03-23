import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/main_page_mod.dart';
import 'package:todo_app/core/enums/sort_task_by.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/sort_task_by_extensions.dart';

//? bu controller ın adını mainPageController olarak değiştirmemi ister misin?
class TodoState with ChangeNotifier {
  SortTaskBy sortTaskBy = SortTaskBy.deadline;
  MainPageMod mainPageMod = MainPageMod.normal;

  final List<Task> _tasks = [];
  final List<Task> _selectedTasks = [];

  List<Task> get tasks => _tasks;
  //? isimlendirmeler tam olmadı gibi enum'ın falan
  List<Task> get taskListInOrder => sortTaskBy.sortTaskList(taskList: _tasks);
  //? iyi bir kullanım mı?
  bool get checkboxVisibilityToggle {
    if (mainPageMod == MainPageMod.select) return true;
    return false;
  }

  bool isCheckboxChecked(Task task) => _selectedTasks.contains(task);

  //? bu isimlendirme hiç olmadı
  void selectedTaskListAddRemoveTaskToggle(Task task) {
    if (_selectedTasks.contains(task)) {
      _selectedTasks.remove(task);
    } else {
      _selectedTasks.add(task);
    }
    notifyListeners();
  }

  void addNewTaskToList({required Task newTask}) {
    _tasks.add(newTask);
    notifyListeners();
  }


  //? single responsiblity'e uymuyor gibi
  //? isimler çok kötü oldu ama daha iyisine bulamadım
  void deleteSelectedTasksButtonFunction() {
    deleteSelectedTasks();
    _selectedTasks.clear();
    openMainPageNormalMod();
  }

  void achieveSelectedTasksButtonFunction() {
    achieveSelectedTasks();
    _selectedTasks.clear();
    openMainPageNormalMod();
  }

  void openMainPageSelectMod() {
    mainPageMod = MainPageMod.select;
    notifyListeners();
  }

  void openMainPageNormalMod() {
    mainPageMod = MainPageMod.normal;
    notifyListeners();
  }



  //sub functions
  void deleteSelectedTasks() {
    for (var item in _selectedTasks) {
      _tasks.remove(item);
    }
  }

  void achieveSelectedTasks() {
    for (var item in _selectedTasks) {
      item.isCompleted = true;
    }
  }
}
