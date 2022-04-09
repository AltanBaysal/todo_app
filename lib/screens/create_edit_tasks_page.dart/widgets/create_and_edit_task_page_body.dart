import 'package:flutter/material.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/widgets/create_and_edit_task_page_description_text_field.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/widgets/create_and_edit_task_page_dropdown_menu.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/widgets/create_and_edit_task_page_time_picker.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/widgets/create_and_edit_task_page_title_text_field.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/widgets/create_or_edit_button_by_create_and_edit_page_mod.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'create_and_edit_task_page_date_picker.dart';

class CreateAndEditTaskPageBody extends StatelessWidget {
  const CreateAndEditTaskPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CreateAndEditTaskPageTitleTextField(),
          const CreateAndEditTaskPageDropdownMenu(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CreateAndEditTaskPageDatePicker(),
              CreateAndEditTaskPageTimePicker(),
            ],
          ),
          const CreateAndEditTaskPageDescriptionTextField(),
          CreateOrEditButtonByCreateAndEditPageMod(
            createAndEditPageMod:
               context.providerOfCreateAndEditTaskController.createAndEditPageMod,
          ),
        ],
      ),
    );
  }
}
