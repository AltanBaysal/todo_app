import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/sort_task_by.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_view/widgets/task_list_view_sorting_popup_menu_child.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_view/widgets/task_list_view_sorting_popup_menu_item_list.dart';

class TaskListViewSortingPopupMenu extends StatelessWidget {
  const TaskListViewSortingPopupMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<TaskSortingType>(
      child: const TaskListViewSortingPopupMenuChild(), //
      itemBuilder: (BuildContext context) =>taskListViewSortingPopupMenuItemList,
      onSelected: (taskSortingType) {
        context.providerOfMainPageController.setTaskSortingType = taskSortingType;
      },
    );
  }
}
