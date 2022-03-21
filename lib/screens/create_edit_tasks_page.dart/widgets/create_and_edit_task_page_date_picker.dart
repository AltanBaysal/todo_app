import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/create_and_edit_task_controller.dart';

class CreateAndEditTaskPageDatePicker extends StatelessWidget {
  const CreateAndEditTaskPageDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        //? datepickerları bu hale getirdim
        Provider.of<CreateAndEditTaskController>(
          context,
          listen: false,
        ).setSelectedDate(
          newDate: await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(DateTime.now().year + 100),
          ),
        );
      },
      child: Consumer<CreateAndEditTaskController>(
        builder: (
          BuildContext context,
          value,
          Widget? child,
        ) {
          return Text(value.selectedDeadLineText);
        },
      ),
    );
  }
}
