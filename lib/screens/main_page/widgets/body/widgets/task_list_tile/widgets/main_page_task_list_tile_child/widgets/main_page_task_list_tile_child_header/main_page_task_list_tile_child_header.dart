import 'package:flutter/material.dart';
import 'package:todo_app/controllers/main_page_controller.dart';
import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/screens/helper/date_time_extensions.dart';
import 'package:todo_app/screens/helper/duration_extensions.dart';
import 'package:todo_app/screens/helper/importance_level_enum_extensions.dart';
import 'package:todo_app/screens/helper/task_list_extensions.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_tile/widgets/main_page_task_list_tile_child/widgets/main_page_task_list_tile_child_header/widgets/main_page_task_list_tile_child_edit_button.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_tile/widgets/main_page_task_list_tile_child/widgets/main_page_task_list_tile_child_header/widgets/main_page_task_list_tile_child_text_covered_stadium_bordered_container.dart';

class MainPageTaskListTileChildHeader extends StatelessWidget {
  const MainPageTaskListTileChildHeader({
    Key? key,
    required this.taskId,
  }) : super(key: key);
  final String taskId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MainPageTaskListTileChildTextCoveredStadiumBorderedContainer(
            label: EnglishTexts.importanceLevel,
            selector: (
              BuildContext context,
              MainPageController mainPageController,
            ) {
              return mainPageController.tasks
                  .findTaskById(taskId)
                  .importanceLevel
                  .text;
            },
          ),
          MainPageTaskListTileChildTextCoveredStadiumBorderedContainer(
            label: EnglishTexts.creationDate,
            selector: (
              BuildContext context,
              MainPageController mainPageController,
            ) {
              return mainPageController.tasks
                  .findTaskById(taskId)
                  .creationDate
                  .text;
            },
          ),
          MainPageTaskListTileChildTextCoveredStadiumBorderedContainer(
            label: EnglishTexts.deadline,
            selector: (
              BuildContext context,
              MainPageController mainPageController,
            ) {
              return mainPageController.tasks
                  .findTaskById(taskId)
                  .deadLine
                  .text;
            },
          ),
          MainPageTaskListTileChildTextCoveredStadiumBorderedContainer(
            label: EnglishTexts.totalDuration,
            selector: (
              BuildContext context,
              MainPageController mainPageController,
            ) {
              return mainPageController.tasks
                  .findTaskById(taskId)
                  .totalDuration
                  .text;
            },
          ),
          MainPageTaskListTileChildEditButton(taskId: taskId),
        ],
      ),
    );
  }
}
