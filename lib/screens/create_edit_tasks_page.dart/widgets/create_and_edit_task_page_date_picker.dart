import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/create_and_edit_task_controller.dart';
import 'package:todo_app/screens/helper/date_time_extensions.dart';

class CreateAndEditTaskPageDatePicker extends StatelessWidget {
  const CreateAndEditTaskPageDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
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
          return Text(value.selectedDeadLine.dateText);
        },
      ),
    );
  }
}
