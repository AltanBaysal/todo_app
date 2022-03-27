import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';

class CreateAndEditTaskPageTitleTextField extends StatelessWidget {
  const CreateAndEditTaskPageTitleTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: context.height * 0.01,
        horizontal: context.width * 0.05,
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          //? hintext controllerdan gelmeliymiş gibi hissediyorum
          hintText: EnglishTexts.enterTitle,
        ),
        autovalidateMode: AutovalidateMode.always,
        controller: context
            .providerOfCreateAndEditTaskController.titleFormFieldController,
        validator: context.providerOfCreateAndEditTaskController.titleValidator,
        key: context.providerOfCreateAndEditTaskController.titleFormFieldKey,
      ),
    );
  }
}
