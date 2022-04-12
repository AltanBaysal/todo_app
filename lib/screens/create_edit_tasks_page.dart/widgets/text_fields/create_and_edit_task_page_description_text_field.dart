import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';

class CreateAndEditTaskPageDescriptionTextField extends StatelessWidget {
  const CreateAndEditTaskPageDescriptionTextField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: context.height * 0.01,
        horizontal: context.width * 0.05,
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: EnglishTexts.enterDescription,
        ),
        autovalidateMode: AutovalidateMode.always,
        controller: context.providerOfCreateAndEditTaskController
            .descriptionFormFieldController,
      ),
    );
  }
}
