import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/main_page_controller.dart';
import 'package:todo_app/core/enums/main_page_mod.dart';
import 'package:todo_app/screens/main_page/widgets/body/widgets/task_list_sorting_popup/task_list_sorting_popup_menu.dart';
import 'package:todo_app/screens/main_page/widgets/sliver_app_bar/widgets/main_page_sliver_app_bar_actions.dart';

class MainPageSliverAppBar extends StatelessWidget {
  //! sliverapp bar olucak
  const MainPageSliverAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Selector<MainPageController, MainPageMod>(
          selector: (
            BuildContext context,
            MainPageController mainPageController,
          ) {
            return mainPageController.mainPageMod;
          },
          builder:
              (BuildContext context, MainPageMod mainPageMod, Widget? child) {
            return MainPageSliverAppBarActions(mainPageMod: mainPageMod);
          },
        ),
        const TaskListSortingPopupMenu(),
      ],
    );
  }
}