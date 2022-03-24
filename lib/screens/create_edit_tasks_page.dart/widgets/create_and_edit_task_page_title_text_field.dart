import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/create_and_edit_task_controller.dart';
import 'package:todo_app/core/constants/text_constants.dart';

class CreateAndEditTaskPageTitleTextField extends StatelessWidget {
  const CreateAndEditTaskPageTitleTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: height * 0.01,
        horizontal: width * 0.05,
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          //? hintext controllerdan gelmeliymiş gibi hissediyorum
          hintText: EnglishTexts.enterTitle,
        ),
        autovalidateMode: AutovalidateMode.always,
        controller: Provider.of<CreateAndEditTaskController>(
          context,
          listen: false,
        ).titleFormFieldController,
        validator: Provider.of<CreateAndEditTaskController>(
          context,
          listen: false,
        ).titleValidator,
        key: Provider.of<CreateAndEditTaskController>(
          context,
          listen: false,
        ).titleFormFieldKey,
      ),
    );
  }
}
