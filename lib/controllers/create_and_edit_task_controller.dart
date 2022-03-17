import 'package:flutter/material.dart';

class CreateAndEditTaskController with ChangeNotifier {
  String? _importanceLevelDropdownMenuValue;// kullanıcının seçtiği item(aytım) enum nesnesi olarak tutulmalı kullanıcıya gösterilirken de bu enum nesnesi üstünden işlem beraber kullanıcıya gösterilicerk şey getirilir 

  String? get importanceLevelDropdownMenuValue => _importanceLevelDropdownMenuValue;

  void setimportanceLevelDropdownMenuValue(String? value){
    _importanceLevelDropdownMenuValue = value;
  }
}
