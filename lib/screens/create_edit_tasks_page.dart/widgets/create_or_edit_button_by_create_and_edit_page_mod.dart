import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/create_and_edit_task_page_mod.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/widgets/create_and_edit_task_page_create_button.dart';
import 'create_and_edit_task_page_edit_button.dart';

class CreateOrEditButtonByCreateAndEditPageMod extends StatelessWidget {
  const CreateOrEditButtonByCreateAndEditPageMod({
    Key? key,
    required this.createAndEditPageMod,
  }) : super(key: key);
  final CreateAndEditPageMod createAndEditPageMod;

  @override
  Widget build(BuildContext context) {
    switch (createAndEditPageMod) {
      case CreateAndEditPageMod.create:
        return const CreateAndEditPageCreateButton();
      case CreateAndEditPageMod.edit:
        return const CreateAndEditPageEditButton();
    }
  }
}
