import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/main_page_controller.dart';
import 'package:todo_app/core/enums/sort_task_by.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/helper/task_list_extensions.dart';

import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_view/task_list_view.dart';
import 'package:tuple/tuple.dart';

class MainPageBody extends StatelessWidget {
  const MainPageBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: context.height * 0.005),
        child: Column(
          children: [
            //!linkedindekinin aynısı yap
        //! selector2 kullanarak birden fazla input alabilirsin 
        ////? tuple kullandım provider package sayfasında onu öneriyordu 
        //ama tuple kullanınça değerler item1 item2 şeklinde oluyor ve okunabilirliği azaltıyor
            Selector<MainPageController, Tuple2<int, TaskSortingType>>(
              selector: (
                BuildContext context,
                MainPageController value,
              ) {
                return Tuple2(value.tasks.withoutAchievedTask.length,
                    value.taskSortingType);
              },
              builder: (
                BuildContext context,
                Tuple2 value,
                child,
              ) {
                List<Task> taskList = context.providerOfMainPageController.tasks.inSelectedOrder(value.item2);
                return TaskListView(taskList: taskList,centerWidget: Text("Center"),); //!
              },
            ),
          ],
        ),
      ),
    );
  }
}
