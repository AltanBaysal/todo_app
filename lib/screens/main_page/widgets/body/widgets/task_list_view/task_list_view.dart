import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_tile/main_page_task_list_tile.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_view/widgets/task_list_view_sorting_popup_menu.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({
    Key? key,
    required this.taskList,
    required this.centerWidget,
  }) : super(key: key);
  final List<Task> taskList;
  final Widget centerWidget;

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
