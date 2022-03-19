import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/create_and_edit_task_controller.dart';
import 'package:todo_app/core/constants/text_constants.dart';

class CreateAndEditPageCreateButton extends StatelessWidget {
  const CreateAndEditPageCreateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: height * 0.04),
      child: ElevatedButton(
        //! listen false olayını bir araştır
        onPressed: () => Provider.of<CreateAndEditTaskController>(
          context,
          listen: false,
        ).createNewTask(context),
        child: const Text(EnglishTexts.create),
      ),
    );
  }
}
