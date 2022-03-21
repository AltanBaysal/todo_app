import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/todo_state.dart';
import 'package:todo_app/core/shared_widgets/icon_covered_gesture_detector.dart';

class MainPageAppBarSelectModActions extends StatelessWidget {
  const MainPageAppBarSelectModActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconCoveredGestureDetector(icon: Icons.delete, onTap: () {}),
        IconCoveredGestureDetector(icon: Icons.check, onTap: () {}),
        IconCoveredGestureDetector(
          icon: Icons.close,
          onTap: () => Provider.of<TodoState>(
            context,
            listen: false,
          ).openMainPageNormalMod(),
        ),
      ],
    );
  }
}
