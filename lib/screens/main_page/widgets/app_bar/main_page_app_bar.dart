
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/main_page_controller.dart';
import 'package:todo_app/screens/main_page/widgets/app_bar/widgets/main_page_app_bar_actions.dart';
import 'package:todo_app/screens/main_page/widgets/app_bar/widgets/main_page_app_bar_leading.dart';

class MainPageAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MainPageAppBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: const MainPageAppBarLeading(),         
        actions: [
          Consumer<MainPageController>(
            builder: (
              BuildContext context,
              MainPageController value,
              Widget? child,
            ) {
              return MainPageAppBarActions(
                mainPageMod: value.mainPageMod,
              );
            },
          )
        ],
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}