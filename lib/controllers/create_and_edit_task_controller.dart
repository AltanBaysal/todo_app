import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/importance_level_enum.dart';

class CreateAndEditTaskController with ChangeNotifier {
  ImportanceLevel selectedImportance = ImportanceLevel.extreme;
  void setselectedImportance(ImportanceLevel? newImportanceLevel) {
    if (newImportanceLevel == null) return;
    selectedImportance = newImportanceLevel;
    notifyListeners();
  }


  DateTime selectedDate = DateTime.now().add(const Duration(days: 1));
  void setSelectedDate({required BuildContext context}) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (newDate == null) return;
    selectedDate = newDate;
    notifyListeners();
  }

  String get selectedDateText => "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}";
}
