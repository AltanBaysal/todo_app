import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/main_page_controller.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/helper/task_list_extensions.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/main_page_body_header.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_view/task_list_view.dart';

class MainPageBody extends StatelessWidget {
  const MainPageBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: context.height * 0.005),
        child: Column(
          children: [
            const MainPageSliverAppBar(),
            Consumer<MainPageController>(
              builder: (
                BuildContext context,
                MainPageController mainPageController,
                child,
              ) {
                List<Task> taskList = mainPageController.tasks
                    .inSelectedOrder(mainPageController.selectedTaskSortingType);
                return TaskListView(taskList: taskList); //!
              },
            ),
          ],
        ),
      ),
    );
  }
}
