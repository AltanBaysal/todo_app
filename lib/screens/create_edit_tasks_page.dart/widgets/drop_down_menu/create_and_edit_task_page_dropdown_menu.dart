import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/create_and_edit_task_controller.dart';
import 'package:todo_app/core/enums/importance_level_enum.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'create_and_edit_task_page_importance_level_dropdown_menu_item_list.dart';

class CreateAndEditTaskPageDropdownMenu extends StatelessWidget {
  const CreateAndEditTaskPageDropdownMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: context.height * 0.01,
        horizontal: context.width * 0.05,
      ),
      child: Consumer<CreateAndEditTaskController>(
        builder: (
          BuildContext context,
          value,
          Widget? child,
        ) {
          return DropdownButton<ImportanceLevel>(
            value: value.selectedImportanceLevel,
            onChanged:value.setselectedImportance,
            items: createAndEditPageImportanceLevelDropdownItemList(importanceLevelValuesInImportanceOrder),
          );
        },
      ),
    );
  }
}