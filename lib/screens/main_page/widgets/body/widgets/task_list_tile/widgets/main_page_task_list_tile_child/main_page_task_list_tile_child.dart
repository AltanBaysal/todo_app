import 'package:flutter/material.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_tile/widgets/main_page_task_list_tile_child/widgets/main_page_task_list_tile_child_description.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_tile/widgets/main_page_task_list_tile_child/widgets/main_page_task_list_tile_child_header/main_page_task_list_tile_child_header.dart';

class MainPageTaskListTileChild extends StatelessWidget {
  const MainPageTaskListTileChild({
    Key? key,
    required this.taskId,
  }) : super(key: key);
  final String taskId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainPageTaskListTileChildHeader(taskId: taskId),
        MainPageTaskListTileChildDescription(taskId: taskId),
      ],
    );
  }
}
