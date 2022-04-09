import 'package:flutter/material.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_tile/widgets/main_page_task_list_tile_child/main_page_task_list_tile_child.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_tile/widgets/main_page_task_list_tile_title/main_page_task_list_tile_title.dart';


class MainPageTaskListTile extends StatelessWidget {
  const MainPageTaskListTile({
    Key? key,
    required this.taskId,
  }) : super(key: key);
  final String taskId;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedAlignment: Alignment.topLeft,
      childrenPadding: EdgeInsets.symmetric(
        horizontal: 0,
        vertical: context.height * 0.01,
      ),
      title: MainPageTaskListTileTitle(
        taskId: taskId,
      ),
      children: [MainPageTaskListTileChild(taskId: taskId)],
    );
  }
}
