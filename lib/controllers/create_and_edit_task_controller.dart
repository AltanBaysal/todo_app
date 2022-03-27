import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/todo_state.dart';
import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/core/enums/create_and_edit_task_page_mod.dart';
import 'package:todo_app/core/enums/importance_level_enum.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/date_time_extensions.dart';

class CreateAndEditTaskController with ChangeNotifier {
  Task? selectedTask;
  CreateAndEditPageMod createAndEditPageMod = CreateAndEditPageMod.create;
  ImportanceLevel selectedImportanceLevel = ImportanceLevel.extreme;
  DateTime selectedDeadLine = DateTime.now();

  final TextEditingController titleFormFieldController =TextEditingController();
  final TextEditingController descriptionFormFieldController =TextEditingController();
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
    if (value != null && value.isNotEmpty) return null;

    return EnglishTexts.thisFieldCannotBeLeftBlank;
  }
  
  bool get isTitleValidate{
    //Todo tekrar bakılacak
    //? extra key tanımlaöaya gerek varmı controllerla direk böyle çözebiliyorum
    return (titleValidator(titleFormFieldController.text) == null);
    
    //? //! current state neden sürekli null dönüyor
    /*
    if(titleFormFieldKey.currentState != null){
      return titleFormFieldKey.currentState!.validate();
    }
    */
  }

  bool get isDeadLineUsable => !selectedDeadLine.isInPast; //!toast message eklenecek

  bool get areAllAreasFormValidate => isDeadLineUsable && isTitleValidate;

  void createNewTask({required BuildContext context}) {
    Task newTask = Task(
      title: titleFormFieldController.text,
      description: descriptionFormFieldController.text,
      importanceLevel: selectedImportanceLevel,
      deadLine: selectedDeadLine,
    );

    setDefaultSettings();

    Provider.of<MainPageController>(
      context,
      listen: false,
    ).addNewTaskToList(newTask);
  }

  void editSelectedTask({required BuildContext context}) {
    //? bunu helper a yazmamı ister misin?
    Provider.of<MainPageController>(
      context,
      listen: false,
    ).editTask(
      task: selectedTask!,
      newTask: Task(
        title: titleFormFieldController.text,
        description: descriptionFormFieldController.text,
        importanceLevel: selectedImportanceLevel,
        deadLine: selectedDeadLine,
      ),
    );
  }

  //? bunu kullanamak baya kötü bir yöntem gibi
  void setDefaultSettings() {
    selectedTask = null;
    selectedImportanceLevel = ImportanceLevel.extreme;
    selectedDeadLine = DateTime.now();
    titleFormFieldController.clear();
    descriptionFormFieldController.clear();
    createAndEditPageMod = CreateAndEditPageMod.create;
  }

  void setPageSettingsForEdit({required Task task}) {
    createAndEditPageMod = CreateAndEditPageMod.edit;
    selectedTask = task;
    selectedImportanceLevel = task.importanceLevel;
    selectedDeadLine = task.deadLine;
    titleFormFieldController.text = task.title;
    descriptionFormFieldController.text = task.description;
  }
}
