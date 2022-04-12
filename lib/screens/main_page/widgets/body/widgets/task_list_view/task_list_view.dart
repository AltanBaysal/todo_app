import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/main_page_controller.dart';
import 'package:todo_app/core/enums/sort_task_by.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/helper/task_sorting_type_extensions.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_tile/main_page_task_list_tile.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({
    Key? key,
    required this.taskList,
    required this.centerWidget,
  }) : super(key: key);
  final List<Task> taskList;
  final Widget centerWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //? center ortaya alıp dropdown menuyu sağa almak için böyle bir taktik yaptım ama sanki iyi bir kod örneği olmadı
            const SizedBox(),
            centerWidget,
            const TaskListViewToggleSortingTypeDropDownMenu(),
          ],
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: taskList.length,
          itemBuilder: (
            BuildContext context,
            int index,
          ) =>
              MainPageTaskListTile(taskId: taskList[index].id),
        ),
      ],
    );
  }
}

class TaskListViewToggleSortingTypeDropDownMenu extends StatelessWidget {
  const TaskListViewToggleSortingTypeDropDownMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: context.height * 0.01,
        horizontal: context.width * 0.05,
      ),
      child: Selector<MainPageController, TaskSortingType>(
        selector: (BuildContext context, MainPageController value) {
          return value.taskSortingType;
        },
        builder: (
          BuildContext context,
          TaskSortingType taskSortingType,
          Widget? child,
        ) {
          return DropdownButton<TaskSortingType>(
            items: mainPageTaskSortingTypeDropDownList,
            onChanged: (taskSortingType) {},
          );
        },
      ),
    );
  }
}

class TaskListViewToggleSortingTypeDropDownMenuItem extends StatelessWidget {
  const TaskListViewToggleSortingTypeDropDownMenuItem(
      {Key? key, required this.taskSortingType})
      : super(key: key);
  final TaskSortingType taskSortingType;

  @override
  Widget build(BuildContext context) {
    return Text(taskSortingType.text);
  }
}

List<DropdownMenuItem<TaskSortingType>>
    get mainPageTaskSortingTypeDropDownList {
  return TaskSortingType.values.map(
    (TaskSortingType taskSortingType) {
      return DropdownMenuItem<TaskSortingType>(
        child: TaskListViewToggleSortingTypeDropDownMenuItem(
          taskSortingType: taskSortingType,
        ),
        value: taskSortingType,
      );
    },
  ).toList();
}
