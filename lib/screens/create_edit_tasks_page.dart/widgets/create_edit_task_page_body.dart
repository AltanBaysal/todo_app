import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/widgets/create_edit_page_dropdown_menu.dart';

import 'create_edit_task_page_date_picker.dart';

class CreateEditTaskPageBody extends StatelessWidget {
  const CreateEditTaskPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              vertical: height * 0.01, horizontal: width * 0.05),
          child: const TextField(
            decoration: InputDecoration(hintText: EnglishTexts.enterTitle),
          ),
        ),
        const CreateEditPageDropdownMenu(),
        const CreateEditPageDatePicker(),
        Container(
          margin: EdgeInsets.symmetric(
              vertical: height * 0.01, horizontal: width * 0.05),
          child: const TextField(
            decoration:
                InputDecoration(hintText: EnglishTexts.enterDescription),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: height * 0.04),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(EnglishTexts.create),
          ),
        ),
      ],
    );
  }
}