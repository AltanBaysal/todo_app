import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/create_and_edit_task_controller.dart';

class CreateAndEditTaskPageDatePicker extends StatelessWidget {
  const CreateAndEditTaskPageDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Provider.of<CreateAndEditTaskController>(context,listen: false)
            .setSelectedDate(context: context);
      }, //? burayı senin gösterdiğin şekilde yazamadım
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
