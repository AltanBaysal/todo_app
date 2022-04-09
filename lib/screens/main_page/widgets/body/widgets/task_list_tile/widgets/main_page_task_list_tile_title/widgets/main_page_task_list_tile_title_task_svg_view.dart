import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/main_page_controller.dart';
import 'package:todo_app/core/shared_widgets/svg_covered_sized_box.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/helper/task_extension.dart';
import 'package:todo_app/screens/helper/task_list_extensions.dart';

class MainPageTaskListTileTitleTaskSvgView extends StatelessWidget {
  const MainPageTaskListTileTitleTaskSvgView({
    Key? key,
    required this.taskId,
  }) : super(key: key);
  final String taskId;

  @override
  Widget build(BuildContext context) {
    return Selector<MainPageController, String>(
      selector: (
        BuildContext context,
        MainPageController mainPageController,
      ) {
        return mainPageController.tasks.findTaskById(taskId).svg;
      },
      builder: (
        BuildContext context,
        taskSvg,
        Widget? child,
      ) {
        return SvgCoveredSizedBox(
          height: context.height * 0.05,
          width: context.height * 0.05,
          svgAssets: taskSvg,
        );
      },
    );
  }
}
