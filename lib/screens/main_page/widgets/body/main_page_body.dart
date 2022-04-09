import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/main_page_controller.dart';
import 'package:todo_app/models/main_page_task_list_selector_values_model.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/main_page/widgets/body/task_list_tile/main_page_task_list_tile.dart';

class MainPageBody extends StatelessWidget {
  const MainPageBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.005),
      child: Selector<MainPageController,MainPageTaskListSelectorValuesModel>(
        selector: (
          BuildContext context,
          MainPageController value,
        ) {
          return value.mainPageTaskListSelectorValues;
        },
        builder: (
          BuildContext context,
          MainPageTaskListSelectorValuesModel value,
          child,
        ) {
          List<Task> taskList = context.providerOfMainPageController.taskListInSelectedOrder; //? bunu burda tanımlamak daha mantıklı builderın içinde tanımlasam fonksiyon task listesi uzunluğu kadar tekrarlanacak
          return ListView.builder(
            itemCount: value.taskListLenght,
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
