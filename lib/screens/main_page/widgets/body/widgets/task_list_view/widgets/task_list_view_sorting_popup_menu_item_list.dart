import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/sort_task_by.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_view/widgets/task_list_view_sorting_popup_menu_item.dart';

List<PopupMenuItem<TaskSortingType>>
//? isimlendirme
    get taskListViewSortingPopupMenuItemList {
  return TaskSortingType.values.map(
    (TaskSortingType taskSortingType) {
      return PopupMenuItem<TaskSortingType>(
        child: TaskListViewSortingPopupMenuItem(
          taskSortingType: taskSortingType,
        ),
        value: taskSortingType,
      );
    },
  ).toList();
}

