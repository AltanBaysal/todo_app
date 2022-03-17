import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/importance_level_enum.dart';

class CreateAndEditTaskController with ChangeNotifier {
  void setselectedImportanceDropdownMenuValue(ImportanceLevel? value){
    selectedImportanceDropdownMenuValue = value;
  }
  ImportanceLevel? selectedImportanceDropdownMenuValue = ImportanceLevel.extreme; 
  //? ImportanceLevel i nullable yapmadan yazabilir miyim burayı ?

  
}