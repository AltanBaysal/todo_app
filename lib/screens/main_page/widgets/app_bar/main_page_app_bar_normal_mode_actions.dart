import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/todo_state.dart';
import 'package:todo_app/core/shared_widgets/icon_covered_gesture_detector.dart';

class MainPageAppBarNormalModActions extends StatelessWidget {
  const MainPageAppBarNormalModActions({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconCoveredGestureDetector(
      icon: Icons.menu,
      onTap: () {
        Provider.of<TodoState>(
          context,
          listen: false,
        ).openMainPageSelectMod();
      },
    );
  }
}
