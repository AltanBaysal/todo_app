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
  bool get checkboxVisibilityToggle{
    if(mainPageMod == MainPageMod.select) return true;
    return false;
  }

  bool isCheckboxChecked(Task task) => _selectedTasks.contains(task);

  //? isimlendirmeler
  void selectedTaskListAddRemoveTaskToggle(Task task) {
    if (_selectedTasks.contains(task)) {
      _tasks.remove(task);
      return;
    }
    _tasks.add(task);
  }

  void addNewTaskToList({required Task newTask}) {
    _tasks.add(newTask);
    notifyListeners();
  }

  void removeTask({required Task task}) {
    _tasks.remove(task);
    notifyListeners();
  }


  //? bunları kullanmak fazla mı abartı 
  void openMainPageSelectMod(){
    mainPageMod = MainPageMod.select;
    notifyListeners();
  }
  
  void openMainPageNormalMod(){
    mainPageMod = MainPageMod.normal;
    notifyListeners();
  }
}
