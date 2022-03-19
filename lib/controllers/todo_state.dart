import 'package:flutter/material.dart';
import 'package:todo_app/models/main_page_task_view.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/task_list_extensions.dart';

//? erase kısmını batırdım gibi
class TodoState with ChangeNotifier {
  final List<Task> _tasks = [];
  List<MainPageTaskView> _mainPageTaskView = [];
  bool isEraseModOn = false;

  List<Task> get tasks => _tasks;
  List<Task> get tasksInTimeOrder => _tasks.putTasksInTimeOrder;
  List<MainPageTaskView> get mainPageTaskView => _mainPageTaskView;

  //? adlandırmalar
  void addNewTaskToList({required Task newTask}) {
    tasks.add(newTask);
    notifyListeners();
  }

  //? bunları servicese koymamı ister misin ?
  void removeTask({required Task task}) {
    _tasks.remove(task);
  }

  void removeTaskById({required String id}) {
    removeTask(
      task: _tasks.findTaskById(id:id),
    );
  }


  void toggleEraseTaskMod() {
    isEraseModOn = !isEraseModOn;
    if (isEraseModOn) {
      for (var element in tasks) {
        _mainPageTaskView.add(MainPageTaskView(element.id));
      }
    }
  }

  void eraseSelectedTasks() {
    for (var item in mainPageTaskView) {
      if (item.isChecked) {
        removeTaskById(id: item.taskId);
      }
    }
    _mainPageTaskView = [];
  }
}
