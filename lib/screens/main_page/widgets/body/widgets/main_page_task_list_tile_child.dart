import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/core/shared_widgets/custom_icon_button.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/helper/date_time_extensions.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/main_page_list_tile_text_covered_stadium_bordered_container.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/create_and_edit_task_page.dart';
import 'package:todo_app/screens/helper/duration_extensions.dart';
import 'package:todo_app/screens/helper/importance_level_enum_extensions.dart';

class MainPageTaskListTileChild extends StatelessWidget {
  const MainPageTaskListTileChild({
    Key? key,
    required this.task,
  }) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              MainPageTaskListTileTextCoveredStadiumBorderedContainer(
                title: EnglishTexts.importanceLevel,
                description: task.importanceLevel.text,
              ),
              MainPageTaskListTileTextCoveredStadiumBorderedContainer(
                title: EnglishTexts.creationDate,
                description: task.creationDate.text,
              ),
              MainPageTaskListTileTextCoveredStadiumBorderedContainer(
                title: EnglishTexts.deadline,
                description: task.deadLine.text,
              ),
              MainPageTaskListTileTextCoveredStadiumBorderedContainer(
                title: EnglishTexts.totalDuration,
                description: task.totalDuration.text,
              ),

              

              CustomIconButton(
                icon: Icons.edit,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateAndEditTasksPage(task: task),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        
        Container(
          padding: EdgeInsets.fromLTRB(context.width *0.05, context.height *0.02, context.width *0.05, context.height *0.01),
          child: Text(task.description,softWrap: true,style: TextStyle(fontSize: context.width*0.036)),
        ),
      ],
    );
  }
}
