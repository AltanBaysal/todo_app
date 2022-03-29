import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/importance_level_enum.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/widgets/create_and_edit_task_page_dropdown_menu_item.dart';


extension ImportanceLevelEnumListExtensions on List<ImportanceLevel> {
  //! view içerisine fonksiyon olarak taşınacak
  List<DropdownMenuItem<ImportanceLevel>> get toCreateAndEditPageImportanceLevelDropdownItemList{
    return map(
      (ImportanceLevel importanceLevel) => DropdownMenuItem<ImportanceLevel>(
        value: importanceLevel,
        child: CreateAndEditPageDropdownMenuItem(importanceLevel : importanceLevel),
      ),
    ).toList();
  }
}
