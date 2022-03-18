import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/importance_level_enum.dart';
import 'package:todo_app/screens/helper/date_time_extensions.dart';

class CreateAndEditTaskController with ChangeNotifier {
  ImportanceLevel selectedImportance = ImportanceLevel.extreme;
  DateTime selectedDateTime = DateTime.now().add(const Duration(days: 1));


  String get selectedDateText =>"${selectedDateTime.year}/${selectedDateTime.month}/${selectedDateTime.day}";

  String get selectedTimeText =>"${selectedDateTime.hourToText}:${selectedDateTime.minuteToText}";

  //? fonksiyonlar yeterince single responsibility'e uymuyor gibi ?
  void setselectedImportance(ImportanceLevel? newImportanceLevel) {
    if (newImportanceLevel == null) return;
    selectedImportance = newImportanceLevel;
    notifyListeners();
  }

  void setSelectedDate({required BuildContext context}) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(selectedDateTime.year + 100),
    );
    if (newDate == null) return;
    selectedDateTime = DateTime(
      newDate.year,
      newDate.month,
      newDate.day,
      selectedDateTime.hour,
      selectedDateTime.minute,
    );
    notifyListeners();
  }

  void setSelectedTime({required BuildContext context}) async {
    //? başka time picker kullanma şansım var mı?
    TimeOfDay? newTimeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if(newTimeOfDay == null) return;
    selectedDateTime = DateTime(
      selectedDateTime.year,
      selectedDateTime.month,
      selectedDateTime.day,
      newTimeOfDay.hour,
      newTimeOfDay.minute,
    );
    notifyListeners();
  }
}
