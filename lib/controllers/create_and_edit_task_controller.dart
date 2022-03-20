import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/todo_state.dart';
import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/core/enums/importance_level_enum.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/date_time_extensions.dart';

class CreateAndEditTaskController with ChangeNotifier {
  ImportanceLevel selectedImportanceLevel = ImportanceLevel.extreme;
  DateTime selectedDeadLine = DateTime.now().add(const Duration(days: 1));

  //? bunları sıfırlayabilmek için final yapmadım
  TextEditingController titleFormFieldController = TextEditingController();
  TextEditingController descriptionFormFieldController = TextEditingController();
  GlobalKey<FormState> titleFormFieldKey = GlobalKey<FormState>();

  
  //Getters
  String get selectedDeadLineText =>
      "${selectedDeadLine.year}/${selectedDeadLine.month}/${selectedDeadLine.day}";
  String get selectedTimeText =>
      "${selectedDeadLine.hourToText}:${selectedDeadLine.minuteToText}";


  //Setters
  void setselectedImportance(ImportanceLevel? newImportanceLevel) {
    if (newImportanceLevel == null) return;
    selectedImportanceLevel = newImportanceLevel;
    notifyListeners();
  }
  
  void setSelectedDate({required DateTime? newDate}) async {    
    //? bu hale getirdim
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
  
  void setSelectedTime({required TimeOfDay? newTimeOfDay}) {
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


  //? bu isim yeterince açıklayıcı değil gibi createAndEditTaskPageTitleFormFieldValidator yapmamı istermisin ismini
  String? titleValidator(String? value){
    if(value != null && value.isNotEmpty){
      return null;
    }
    return EnglishTexts.thisFieldCannotBeLeftBlank;
  }

  //! isvalidate tekrar düzenlenecek
  bool isTitleValidate(){
    //? extra key tanımlaöaya gerek varmı controllerla direk böyle çözebiliyorum
    if(titleValidator(titleFormFieldController.text) == null) return true;
    return false;

    //? //! current state neden sürekli null dönüyor araştır
    /*
    if(titleFormFieldKey.currentState == null){
      return false;
    }
    //? alttakini forcelamak zorunda kalmamak için üstekini yazdım ama yinede forcelamak zorunda kalıyorum :(
    return titleFormFieldKey.currentState!.validate();
    */
  }
  
  bool isDeadLineUsable(){
    return !selectedDeadLine.isInPast;
    //!toast message eklenecek
  }


  //? bool eklemek zorunda kaldım pop için
  bool createNewTask(BuildContext context) {
    if(!isDeadLineUsable() || !isTitleValidate()) return false;

    Task newTask = Task(
      title: titleFormFieldController.text,
      description: descriptionFormFieldController.text,
      importanceLevel: selectedImportanceLevel,
      deadLine: selectedDeadLine,
    );

    returnDefaultSettings();
    Provider.of<TodoState>(context, listen: false).addNewTaskToList(newTask: newTask); //?
    return true;
  }
  

  //? aslında controller'ı sayfa oluşurken ayağa kaldırsam sayfa her oluştuğunda sıfırlanır gibi ? 
  void returnDefaultSettings() {
    selectedImportanceLevel = ImportanceLevel.extreme;
    selectedDeadLine = DateTime.now();
    titleFormFieldController = TextEditingController();
    descriptionFormFieldController = TextEditingController();
    titleFormFieldKey = GlobalKey<FormState>();
  }
}
