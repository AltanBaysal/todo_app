import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/create_and_edit_task_controller.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/widgets/create_and_edit_task_page_description_text_field.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/widgets/create_and_edit_task_page_dropdown_menu.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/widgets/create_and_edit_task_page_time_picker.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/widgets/create_and_edit_task_page_title_text_field.dart';
import 'create_and_edit_task_page_date_picker.dart';

class CreateAndEditTaskPageBody extends StatelessWidget {
  const CreateAndEditTaskPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Provider.of<CreateAndEditTaskController>(context).createOrEditButtonByCreateAndEditPageMod,
      ],
    );
  }
}
