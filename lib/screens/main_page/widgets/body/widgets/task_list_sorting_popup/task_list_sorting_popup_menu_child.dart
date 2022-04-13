import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/main_page_controller.dart';
import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/core/enums/sort_task_by.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/helper/task_sorting_type_extensions.dart';

class TaskListSortingPopupMenuChild extends StatelessWidget {
  const TaskListSortingPopupMenuChild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<MainPageController, TaskSortingType>(
      selector: (BuildContext context, MainPageController mainPageController) {
        return mainPageController.selectedTaskSortingType;
      },
      builder: (BuildContext context, TaskSortingType value, Widget? child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              EnglishTexts.sortBy +
                  context.providerOfMainPageController.selectedTaskSortingType
                      .text,
              style: TextStyle(fontSize: context.width * 0.035),
            ),
            Icon(
              Icons.keyboard_arrow_down_sharp,
              size: context.width * 0.04,
            ),
          ],
        );
      },
    );
  }
}
