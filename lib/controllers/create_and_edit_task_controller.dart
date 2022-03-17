import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/text_constants.dart';

class CreateAndEditTaskController with ChangeNotifier {
  final List<String> impotanceLevelTextList = [//! extension olarak yap 
    EnglishTexts.importanceLevelExtreme,
    EnglishTexts.importanceLevelVery,
    EnglishTexts.importanceLevelPretty,
    EnglishTexts.importanceLevelNormal,
    EnglishTexts.importanceLevelLess
  ];

  String? _importanceLevelDropdownMenuValue;// kullanıcının seçtiği item(aytım) enum nesnesi olarak tutulmalı kullanıcıya gösterilirken de bu enum nesnesi üstünden işlem beraber kullanıcıya gösterilicerk şey getirilir 

  String? get importanceLevelDropdownMenuValue => _importanceLevelDropdownMenuValue;

  void setimportanceLevelDropdownMenuValue(String? value){
    _importanceLevelDropdownMenuValue = value;
  }
}
