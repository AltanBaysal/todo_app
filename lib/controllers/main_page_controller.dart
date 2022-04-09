import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/importance_level_enum.dart';
import 'package:todo_app/core/enums/main_page_mod.dart';
import 'package:todo_app/core/enums/shared_preferences_keys.dart';
import 'package:todo_app/core/enums/sort_task_by.dart';
import 'package:todo_app/core/utils/data/model/shared_preferences_reading_parameter_model.dart';
import 'package:todo_app/core/utils/data/model/shared_preferences_repository_implementation.dart';
import 'package:todo_app/core/utils/data/shared_preferences_writing_parameter_model.dart';
import 'package:todo_app/models/main_page_task_list_selector_values_model.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/sort_task_by_extensions.dart';

//! providerları geliştir
class MainPageController with ChangeNotifier {
  TaskSortingType taskSortingType = TaskSortingType.deadline;
  MainPageMod mainPageMod = MainPageMod.listing;
  List<Task> _tasks = [];
  final List<Task> selectedTasks = [];

  //! provider constructer'ına ver
  void init() {
    _tasks = _getTask;
  }

  //Local Storage
  List<Task> get _getTask {
    SharedPreferencesReadingParameterModel paramater =
        SharedPreferencesReadingParameterModel(SharedPreferencesKeys.taskList);
    String? data = SharedPreferencesRepositoryImplementation().read(paramater);
    if (data != null) {
      return jsonDecode(data);
    }
    return [];
  }

  void saveTasks() async {
    String json = jsonEncode(_tasks);
    SharedPreferencesWritingParameterModel paramater =
        SharedPreferencesWritingParameterModel(
      SharedPreferencesKeys.taskList,
      json,
    );
    await SharedPreferencesRepositoryImplementation().write(paramater);
  }
  //

  //Getters
  List<Task> get tasks => _tasks;

  List<Task> get taskListInSelectedOrder {
    return taskSortingType.sortTaskList(taskList: _tasks);
  }

  bool get isTaskCheckboxVisible => mainPageMod == MainPageMod.select;
  //

  //? isimlendirme
  MainPageTaskListSelectorValuesModel get mainPageTaskListSelectorValues {
    return MainPageTaskListSelectorValuesModel(
      _tasks.length,
      taskSortingType,
    );
  }

  bool isCheckboxChecked(Task task) {
    return selectedTasks.contains(task);
  }

  void toggleTaskSortType() {
    //! bunu geliştir
    if (taskSortingType == TaskSortingType.deadline) {
      taskSortingType = TaskSortingType.importanceAndDeadline;
    } else {
      taskSortingType = TaskSortingType.deadline;
    }
    notifyListeners();
  }

  void addToTaskListWithNotifyListener({
    required Task newTask,
    required List<Task> tasklist,
  }) {
    tasklist.add(newTask);
    notifyListeners();
  }

  void removeFromTaskListWithNotifyListener({
    required Task newTask,
    required List<Task> tasklist,
  }) {
    tasklist.remove(newTask);
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
    if (task != newTask) {
      task.title = newTask.title;
      task.description = newTask.description;
      task.importanceLevel = newTask.importanceLevel;
      task.deadLine = newTask.deadLine;
      saveTasks();
      notifyListeners();
    }
  }

  void createNewTask({
    required String title,
    required String description,
    required ImportanceLevel importanceLevel,
    required DateTime deadLine,
  }) {
    Task newTask = Task(
      title: title,
      description: description,
      importanceLevel: importanceLevel,
      deadLine: deadLine,
    );
    _tasks.add(newTask);
    notifyListeners();
    saveTasks();
  }

  void deleteSelectedTasks() {
    _tasks.removeWhere(
      (task) => selectedTasks.contains(task),
    );
    saveTasks();
  }

  void achieveSelectedTasks() {
    for (var _tasks in selectedTasks) {
      _tasks.setCompleted();
    }
    saveTasks();
  }
}
