import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/create_and_edit_task_controller.dart';

class CreateAndEditTaskPageDescriptionTextField extends StatelessWidget {
  const CreateAndEditTaskPageDescriptionTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
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
    );
  }
}
