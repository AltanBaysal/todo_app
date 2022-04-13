import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/main_page_controller.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/helper/task_list_extensions.dart';

class MainPageTaskListTileChildDescription extends StatelessWidget {
  const MainPageTaskListTileChildDescription({
    Key? key,
    required this.taskId,
  }) : super(key: key);
  final String taskId;

  @override
  Widget build(BuildContext context) {
    return Selector<MainPageController, String>(
      selector: (
        BuildContext buildContext,
        MainPageController mainPageController,
      ) {
        return mainPageController.tasks.findTaskById(taskId).description;
      },
      builder: (
        BuildContext context,
        String description,
        Widget? child,
      ) {
        return Visibility(
          visible: description.isNotEmpty,
          child: Container(
            padding: EdgeInsets.fromLTRB(
              context.width * 0.05,
              context.height * 0.02,
              context.width * 0.05,
              context.height * 0.01,
            ),
            child: Text(
              description,
              softWrap: true,
              style: TextStyle(
                fontSize: context.width * 0.036,
              ),
            ),
          ),
        );
      },
    );
  }
}
