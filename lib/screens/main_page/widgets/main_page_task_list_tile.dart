import 'package:flutter/material.dart';
import 'package:todo_app/models/goal.dart';
import 'package:todo_app/screens/main_page/widgets/main_page_task_list_tile_child.dart';
import 'package:todo_app/screens/main_page/widgets/main_page_task_list_tile_title.dart';

class MainPageTaskListTile extends StatelessWidget {
  const MainPageTaskListTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ExpansionTile(
      expandedAlignment: Alignment.topLeft,
      childrenPadding: EdgeInsets.symmetric(
        horizontal: width * 0.045,
        vertical: height * 0.01,
      ),
      title: MainPageTaskListTileTitle(task: task),
      children: [MainPageTaskListTileChild(task: task)],
    );
  }
}
