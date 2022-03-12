import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/todo_state.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/create_edit_task_page.dart';
import 'package:todo_app/screens/main_page/ui/main_page_task_list_tile.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateEditTasksPage(),
            ),
          );
        },
      ),
      body: Padding(
        padding: EdgeInsets.only(top: height * 0.005),
        child: Consumer<TodoState>(
          builder: (_, value, __) => ListView.builder(
            itemCount: value.goals.length,
            itemBuilder: (context, index) {
              return MainPageTaskListTile(index: index);
            },
          ),
        ),
      ),
    );
  }
}
