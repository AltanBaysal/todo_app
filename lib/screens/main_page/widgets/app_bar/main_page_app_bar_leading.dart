import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/todo_state.dart';
import 'package:todo_app/core/shared_widgets/icon_covered_gesture_detector.dart';

class MainPageAppBarLeading extends StatelessWidget {
  const MainPageAppBarLeading({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: Icons.share,
      onTap: () => Provider.of<MainPageController>(context,listen: false).toggleTaskSortType(),
    );
  }
}