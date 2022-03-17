import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/todo_state.dart';
import 'package:todo_app/screens/create_edit_tasks_page.dart/create_edit_task_page.dart';
import 'package:todo_app/screens/main_page/widgets/main_page_task_list_tile.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: const _MainPageFloatingActionButton(),
      body: const _MainPageBody(),
    );
  }
}

//? bu kullanım sanki daha iyi ne düşünüyorsun ?
// widgets ın altına ekle
class _MainPageFloatingActionButton extends StatelessWidget {
  const _MainPageFloatingActionButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CreateEditTasksPage(),
          ),
        );
      },
    );
  }
}

class _MainPageBody extends StatelessWidget {
  const _MainPageBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.005),
      child: Consumer<TodoState>(
        builder: (_, value, __) => ListView.builder(
          itemCount: value.goals.length,
          itemBuilder: (context, index) {
            return MainPageTaskListTile(index: value.goals[index]);
          },
        ),
      ),
    );
  }
}
