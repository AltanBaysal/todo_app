import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/main_page_controller.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/main_page_task_list_tile.dart';

class MainPageBody extends StatelessWidget {
  const MainPageBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.005),
      child: Consumer<MainPageController>(
        builder: (
          BuildContext context,
          MainPageController value,
          Widget? child,
        ) {
          return ListView.builder(
            itemCount: value.taskListInSelectedOrder.length,
            itemBuilder: (context, index) {
              return MainPageTaskListTile(task: value.taskListInSelectedOrder[index],value: value,);
            },
          );
        },
      ),
    );
  }
}

//! any i araştır list için