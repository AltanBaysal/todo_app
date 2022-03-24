import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/create_and_edit_task_controller.dart';
import 'package:todo_app/core/constants/text_constants.dart';

class CreateAndEditPageEditButton extends StatelessWidget {
  const CreateAndEditPageEditButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: height * 0.04),
      child: ElevatedButton(
        onPressed: () {
          if (Provider.of<CreateAndEditTaskController>(
            context,
            listen: false,
          ).editSelectedTask(context: context)) Navigator.pop(context);
        },
        child: const Text(EnglishTexts.edit),
      ),
    );
  }
}