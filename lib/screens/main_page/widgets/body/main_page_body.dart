import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/main_page_controller.dart';
import 'package:todo_app/core/enums/sort_task_by.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/main_page/widgets/body/task_list_tile/main_page_task_list_tile.dart';
import 'package:tuple/tuple.dart';

class MainPageBody extends StatelessWidget {
  const MainPageBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.005),
      //! selector2 kullanarak birden fazla input alabilirsin 
      ////? tuple kullandım provider package sayfasında onu öneriyordu 
      //ama tuple kullanınça değerler item1 item2 şeklinde oluyor ve okunabilirliği azaltıyor
      child: Selector<MainPageController,Tuple2<int,TaskSortingType>>(
        selector: (
          BuildContext context,
          MainPageController value,
        ) {
          return Tuple2(value.tasks.length,value.taskSortingType);
        },
        builder: (
          BuildContext context,
          Tuple2 value,
          child,
        ) {
          List<Task> taskList = context.providerOfMainPageController.taskListInSelectedOrder; 
          return ListView.builder(
            itemCount: value.item1,
            itemBuilder: (
              context,
              index,
            ) {
              return MainPageTaskListTile(
                taskId: taskList[index].id,
              );
            },
          );
        },
      ),
    );
  }
}
