import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/importance_level_enum.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/widgets/drop_down_menu/create_and_edit_task_page_dropdown_menu_item.dart';

List<DropdownMenuItem<ImportanceLevel>>
    createAndEditPageImportanceLevelDropdownItemList(
        List<ImportanceLevel> importanceLevelList) {
  return importanceLevelList.map((ImportanceLevel importanceLevel) {
    return DropdownMenuItem<ImportanceLevel>(
      value: importanceLevel,
      child: CreateAndEditPageDropdownMenuItem(
        importanceLevel: importanceLevel,
      ),
    );
  }).toList();
}
