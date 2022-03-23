import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/todo_state.dart';
import 'package:todo_app/screens/main_page/widgets/app_bar/main_page_app_bar_actions.dart';
import 'package:todo_app/screens/main_page/widgets/body/main_page_body.dart';
import 'package:todo_app/screens/main_page/widgets/main_page_floating_action_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! appbar ı farklı widget a koy
      appBar: AppBar(
        actions: [
          Consumer<TodoState>(
            builder: (
              BuildContext context,
              TodoState value,
              Widget? child,
            ) {
              return MainPageAppBarActions(
                mainPageMod: value.mainPageMod,
              );
            },
          )
        ],
      ),

      floatingActionButton: const MainPageFloatingActionButton(),
      body: const MainPageBody(),
    );
  }
}
