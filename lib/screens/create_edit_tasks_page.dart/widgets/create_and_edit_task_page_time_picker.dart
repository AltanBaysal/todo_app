import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/create_and_edit_task_controller.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/helper/date_time_extensions.dart';

class CreateAndEditTaskPageTimePicker extends StatelessWidget {
  const CreateAndEditTaskPageTimePicker({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        context.providerOfCreateAndEditTaskController.setSelectedTime(
          newTimeOfDay: await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          ),
        );
      },
      child: Consumer<CreateAndEditTaskController>(
        builder: (
          BuildContext context,
          value,
          Widget? child,
        ) {
          return Text(value.selectedDeadLine.timeText);
        },
      ),
    );
  }
}
