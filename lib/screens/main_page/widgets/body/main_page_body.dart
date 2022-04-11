import 'package:flutter/material.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/ongoing_task_list_view/ongoing_task_list_view.dart';



class MainPageBody extends StatelessWidget {
  const MainPageBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: context.height * 0.005),
        child: Column(
          children: const [
             OngoingTaskListView(),
          ],
        ),
      ),
    );
  }
}
