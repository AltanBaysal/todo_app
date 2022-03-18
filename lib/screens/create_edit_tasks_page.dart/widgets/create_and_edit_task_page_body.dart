import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/create_and_edit_task_controller.dart';
import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/widgets/create_and_edit_task_page_dropdown_menu.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/widgets/create_and_edit_task_page_time_picker.dart';
import 'create_and_edit_task_page_date_picker.dart';

class CreateAndEditTaskPageBody extends StatelessWidget {
  const CreateAndEditTaskPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        //! burayı dağıt
        Container(
          margin: EdgeInsets.symmetric(
            vertical: height * 0.01,
            horizontal: width * 0.05,
          ),
          child: Consumer<CreateAndEditTaskController>(
            builder: (BuildContext context, value, Widget? child) => TextField(
              decoration: InputDecoration(
                hintText: value.titleTextField.hintText,
                errorText: value.titleTextField.erorText,
              ),
              onChanged: value.setTitleTextField,
            ),
          ),
        ),

        const CreateAndEditTaskPageDropdownMenu(),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            CreateAndEditTaskPageDatePicker(),
            CreateAndEditTaskPageTimePicker(),
          ],
        ),

        Container(
          margin: EdgeInsets.symmetric(
            vertical: height * 0.01,
            horizontal: width * 0.05,
          ),
          child: Consumer<CreateAndEditTaskController>(
            builder: (context, value, child) => TextField(
              decoration: InputDecoration(
                hintText: value.descriptionTextField.hintText,
                errorText: value.descriptionTextField.erorText,
              ),
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: height * 0.04),
          child: ElevatedButton(
            //! listen false olayını bir araştır
            onPressed: () => Provider.of<CreateAndEditTaskController>(context,listen: false).createNewTask(context),
            child: const Text(EnglishTexts.create),
          ),
        ),
      ],
    );
  }
}
