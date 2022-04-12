import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_tile/main_page_task_list_tile.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({
    Key? key,
    required this.taskList,
  }) : super(key: key);
  final List<Task> taskList;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: taskList.length,
          itemBuilder: (
            BuildContext context,
            int index,
          ) =>
              MainPageTaskListTile(taskId: taskList[index].id),
        ),
      ],
    );
  }
}
