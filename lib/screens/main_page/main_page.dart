import 'package:flutter/material.dart';
import 'package:todo_app/screens/main_page/widgets/body/main_page_body.dart';
import 'package:todo_app/screens/main_page/widgets/main_page_floating_action_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        floatingActionButton: MainPageFloatingActionButton(),
        body: MainPageBody(),
      ),
    );
  }
}