import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';

class CreateAndEditPageEditButton extends StatelessWidget {
  const CreateAndEditPageEditButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: context.height * 0.04),
      child: ElevatedButton(
        onPressed: () {
          if (context.providerOfCreateAndEditTaskController.areAllAreasFormValidate) {
            context.providerOfCreateAndEditTaskController
                .editSelectedTask(context: context);
            Navigator.pop(context);
          }
        },
        child: const Text(EnglishTexts.edit),
      ),
    );
  }
}
