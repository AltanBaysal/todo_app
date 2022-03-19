import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/todo_state.dart';
import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/core/enums/importance_level_enum.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/text_field.dart';
import 'package:todo_app/screens/helper/date_time_extensions.dart';

//? sanki biraz fazla kalabalık oldu
class CreateAndEditTaskController with ChangeNotifier {
  ImportanceLevel selectedImportanceLevel = ImportanceLevel.extreme;

  DateTime selectedDeadLine = DateTime.now().add(const Duration(days: 1));

  TextFieldModel _titleTextField = TextFieldModel(
    text: "",
    hintText: EnglishTexts.enterTitle,
    erorText: null,
  );

  final TextFieldModel _descriptionTextField = TextFieldModel(
    text: "",
    hintText: EnglishTexts.enterDescription,
    erorText: null,
  );

  //Getters
  String get selectedDeadLineText =>
      "${selectedDeadLine.year}/${selectedDeadLine.month}/${selectedDeadLine.day}";
  String get selectedTimeText =>
      "${selectedDeadLine.hourToText}:${selectedDeadLine.minuteToText}";

  TextFieldModel get titleTextField => _titleTextField;
  TextFieldModel get descriptionTextField => _descriptionTextField;

  //Setters
  //? fonksiyonlar yeterince single responsibility'e uymuyor gibi ?
  void setselectedImportance(ImportanceLevel? newImportanceLevel) {
    if (newImportanceLevel == null) return;
    selectedImportanceLevel = newImportanceLevel;
    notifyListeners();
  }

  void setSelectedDate({required BuildContext context}) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: selectedDeadLine,
      firstDate: DateTime.now(),
      lastDate: DateTime(selectedDeadLine.year + 100),
    );
    if (newDate == null) return;
    selectedDeadLine = DateTime(
      newDate.year,
      newDate.month,
      newDate.day,
      selectedDeadLine.hour,
      selectedDeadLine.minute,
    );
    notifyListeners();
  }

  void setSelectedTime({required BuildContext context}) async {
    //? başka time picker kullanma şansım var mı?
    TimeOfDay? newTimeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (newTimeOfDay == null) return;
    selectedDeadLine = DateTime(
      selectedDeadLine.year,
      selectedDeadLine.month,
      selectedDeadLine.day,
      newTimeOfDay.hour,
      newTimeOfDay.minute,
    );
    notifyListeners();
  }

  //? videoda adam titledaki gibi yazdı ama bence descriptiondaki daha mantıklı ? video -> https://www.youtube.com/watch?v=Hr_-EqUR0lA&t=19s&ab_channel=AndyJulow
  void setTitleTextField(String value) {
    if (value.isEmpty) {
      _titleTextField = TextFieldModel(
        hintText: _titleTextField.hintText,
        erorText: EnglishTexts.thisFieldCannotBeLeftBlank,
        text: value,
      );
    } else {
      _titleTextField = TextFieldModel(
        hintText: _titleTextField.hintText,
        erorText: null,
        text: value,
      );
    }
    notifyListeners();
  }

  void setDescriptionTextField(String value) {
    _descriptionTextField.text = value;
    notifyListeners();
  }


  //? isimlendirme doğru mu ?
  bool isTitleUsable(){
    if(_titleTextField.text.isEmpty){
      setTitleTextField("");
    }
    if(_titleTextField.erorText != null) return false;
    return true;
  } 
  
  bool isDeadLineUsable(){
    return !selectedDeadLine.isInPast;
    //!toast message eklenecek
  }
  //? baya kötü bir kullanım oldu

  void createNewTask(BuildContext context) {
    if(!isTitleUsable()) return;
    if(!isDeadLineUsable()) return;

    Task newTask = Task(
      title: titleTextField.text,
      description: descriptionTextField.text,
      importanceLevel: selectedImportanceLevel,
      deadLine: selectedDeadLine,
    );

    returnDefaultSettings();

    Provider.of<TodoState>(context, listen: false).addNewTaskToList(
        newTask: newTask); //? bu ve altındaki baya kötü bir kullanım gibi oldu
    Navigator.pop(context);
  }

  void returnDefaultSettings() {
    selectedImportanceLevel = ImportanceLevel.extreme;
    selectedDeadLine = DateTime.now().add(const Duration(days: 1));
    _titleTextField.text = "";
    _descriptionTextField.text = "";
  }
}
