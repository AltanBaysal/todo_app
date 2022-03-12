import 'package:flutter/material.dart';
import 'package:todo_app/constants/text_constants.dart';

class CreateOrEditTaskState with ChangeNotifier {
  final List<String> impotanceLevelDropdownMenuList = [
    EnglishTexts.importanceLevelextreme,
    EnglishTexts.importanceLevelvery,
    EnglishTexts.importanceLevelpretty,
    EnglishTexts.importanceLevelnormal,
    EnglishTexts.importanceLevelless
  ];

  String? _importanceLevelDropdownMenuValue;

  String? get importanceLevelDropdownMenuValue => _importanceLevelDropdownMenuValue;

  void setimportanceLevelDropdownMenuValue(String? value){
    _importanceLevelDropdownMenuValue = value;
  }



  
}
