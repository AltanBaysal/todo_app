import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/main_page_mod.dart';
import 'package:todo_app/core/shared_widgets/custom_icon_button.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';

class MainPageSliverAppBarSelectModActions extends StatelessWidget {
  const MainPageSliverAppBarSelectModActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         CustomIconButton(
          icon: Icons.close,
          onTap: () {
            context.providerOfMainPageController
                .setMainPageMod(MainPageMod.listing);
            context.providerOfMainPageController.selectedTasks.clear();
          },
        ),
        CustomIconButton(
          icon: Icons.check,
          onTap: () {
            context.providerOfMainPageController.achieveSelectedTasks();
            context.providerOfMainPageController.selectedTasks.clear();
            context.providerOfMainPageController
                .setMainPageMod(MainPageMod.listing);
          },
        ),
        CustomIconButton(
          icon: Icons.delete,
          onTap: () {
            context.providerOfMainPageController.deleteSelectedTasks();
            context.providerOfMainPageController.selectedTasks.clear();
            context.providerOfMainPageController
                .setMainPageMod(MainPageMod.listing);
          },
        ),
        
       
      ],
    );
  }
}
