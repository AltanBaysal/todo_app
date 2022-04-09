import 'package:flutter/material.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_tile/widgets/main_page_task_list_tile_title/widgets/main_page_task_list_tile_title_task_remain_time_indicator.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_tile/widgets/main_page_task_list_tile_title/widgets/main_page_task_list_tile_title_task_svg_view.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_tile/widgets/main_page_task_list_tile_title/widgets/main_page_task_list_tile_title_task_title.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_tile/widgets/main_page_task_list_tile_title/widgets/main_page_task_list_title_task_select_toggle.dart';

class MainPageTaskListTileTitle extends StatelessWidget {
  const MainPageTaskListTileTitle({
    Key? key,
    required this.taskId,
  }) : super(key: key);

  final String taskId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            MainPageTaskListTitleTaskCheckedBox(taskId: taskId),
            //?bunları constant yapmak için bir fikrin var mı?
            MainPageTaskListTileTitleTaskSvgView(taskId: taskId),

            MainPageTaskListTileTaskTitle(taskId: taskId),
          ],
        ),
        MainPageTaskListTileTitleTaskRemainTimeIndicator(taskId: taskId),
      ],
    );
  }
}
