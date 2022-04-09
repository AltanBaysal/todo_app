import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/core/enums/create_and_edit_task_page_mod.dart';
import 'package:todo_app/core/enums/importance_level_enum.dart';
import 'package:todo_app/core/services/global_build_context_services.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/helper/date_time_extensions.dart';

class CreateAndEditTaskController with ChangeNotifier {
  Task? selectedTask;
  CreateAndEditPageMod createAndEditPageMod = CreateAndEditPageMod.create;
  ImportanceLevel selectedImportanceLevel = ImportanceLevel.extreme;
  DateTime selectedDeadLine = DateTime.now();

  final TextEditingController titleFormFieldController =
      TextEditingController();
  final TextEditingController descriptionFormFieldController =
      TextEditingController();
  GlobalKey<FormState> titleFormFieldKey = GlobalKey<FormState>();

  void setselectedImportance(ImportanceLevel? newImportanceLevel) {
    if (newImportanceLevel != null) {
      selectedImportanceLevel = newImportanceLevel;
      notifyListeners();
    }
  }

  void setSelectedDate({required DateTime? newDate}) async {
    if (newDate != null) {
      selectedDeadLine = DateTime(
        newDate.year,
        newDate.month,
        newDate.day,
        selectedDeadLine.hour,
        selectedDeadLine.minute,
      );
      notifyListeners();
    }
  }

  void setSelectedTime({required TimeOfDay? newTimeOfDay}) {
    if (newTimeOfDay != null) {
      selectedDeadLine = DateTime(
        selectedDeadLine.year,
        selectedDeadLine.month,
        selectedDeadLine.day,
        newTimeOfDay.hour,
        newTimeOfDay.minute,
      );
      notifyListeners();
    }
  }

  String? titleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return EnglishTexts.thisFieldCannotBeLeftBlank;
    }
    return null;
  }

  bool get isTitleValidate {
    return titleValidator(titleFormFieldController.text) == null;
  }

  bool get isDeadLineUsable =>
      !selectedDeadLine.isInPast; //!toast message eklenecek

  bool get areAllAreasFormValidate => isDeadLineUsable && isTitleValidate;

  void createNewTask() {
    GlobalBuildContextService()
        .globalBuildContext
        .providerOfMainPageController
        .createNewTask(
          title: titleFormFieldController.text,
          description: descriptionFormFieldController.text,
          importanceLevel: selectedImportanceLevel,
          deadLine: selectedDeadLine,
        );
  }

  void editSelectedTask() {
    GlobalBuildContextService()
        .globalBuildContext
        .providerOfMainPageController
        .editTask(
          task: selectedTask!,
          newTask: Task(
            title: titleFormFieldController.text,
            description: descriptionFormFieldController.text,
            importanceLevel: selectedImportanceLevel,
            deadLine: selectedDeadLine,
          ),
        );
  }

  void setPageSetting({Task? task}) {
    if (task == null) {
      setPageSettingsForCreate();
    } else {
      setPageSettingsForEdit(task);
    }
  }

  void setPageSettingsForCreate() {
    selectedTask = null;
    selectedImportanceLevel = ImportanceLevel.extreme;
    selectedDeadLine = DateTime.now();
    titleFormFieldController.clear();
    descriptionFormFieldController.clear();
    createAndEditPageMod = CreateAndEditPageMod.create;
  }

  void setPageSettingsForEdit(Task task) {
    titleFormFieldController.clear();
    descriptionFormFieldController.clear();

    createAndEditPageMod = CreateAndEditPageMod.edit;
    selectedTask = task;
    selectedImportanceLevel = task.importanceLevel;
    selectedDeadLine = task.deadLine;
    titleFormFieldController.text = task.title;
    descriptionFormFieldController.text = task.description;
  }
}
