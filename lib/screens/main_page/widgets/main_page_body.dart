import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/todo_state.dart';
import 'main_page_task_list_tile.dart';

class MainPageBody extends StatelessWidget {
  const MainPageBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.005),
      child: Consumer<TodoState>(
        builder: (
          BuildContext context,
          TodoState value,
          Widget? child,
        ) {
          return ListView.builder(
            itemCount: value.goals.length,
            itemBuilder: (context, index) {
              return MainPageTaskListTile(task: value.goals[index]);
            },
          );
        },
      ),
    );
  }
}