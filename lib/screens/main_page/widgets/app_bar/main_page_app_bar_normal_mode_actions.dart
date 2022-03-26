import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/todo_state.dart';
import 'package:todo_app/core/enums/main_page_mod.dart';
import 'package:todo_app/core/shared_widgets/icon_covered_gesture_detector.dart';

class MainPageAppBarNormalModActions extends StatelessWidget {
  const MainPageAppBarNormalModActions({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: Icons.menu,
      onTap: () {
        Provider.of<MainPageController>(
          context,
          listen: false,
        ).setMainPageMod(MainPageMod.select);
      },
    );
  }
}
