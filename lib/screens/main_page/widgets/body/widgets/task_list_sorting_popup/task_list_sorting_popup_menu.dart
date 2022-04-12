import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/sort_task_by.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_sorting_popup/task_list_sorting_popup_menu_child.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_sorting_popup/task_list_sorting_popup_menu_item_list.dart';

class TaskListSortingPopupMenu extends StatelessWidget {
  const TaskListSortingPopupMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.04,
        vertical: context.height * 0.01,
      ),
      child: PopupMenuButton<TaskSortingType>(
        child: const TaskListSortingPopupMenuChild(), //
        itemBuilder: (BuildContext context) => taskListSortingPopupMenuItemList,
        onSelected: (taskSortingType) {
          context.providerOfMainPageController.setTaskSortingType =
              taskSortingType;
        },
      ),
    );
  }
}
