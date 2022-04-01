import 'package:flutter/material.dart';
import 'package:todo_app/controllers/main_page_controller.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/main_page_task_list_tile_title.dart';

import 'main_page_task_list_tile_child.dart';

class MainPageTaskListTile extends StatelessWidget {
  const MainPageTaskListTile({
    Key? key,
    required this.task,
    required this.value
  }) : super(key: key);

  final MainPageController value;
  final Task task;
  
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedAlignment: Alignment.topLeft,
      childrenPadding: EdgeInsets.symmetric(
        horizontal: context.width * 0.045,
        vertical: context.height * 0.01,
      ),
      title: MainPageTaskListTileTitle(task: task,value: value,),
      children: [MainPageTaskListTileChild(task: task)],
    );
  }
}
