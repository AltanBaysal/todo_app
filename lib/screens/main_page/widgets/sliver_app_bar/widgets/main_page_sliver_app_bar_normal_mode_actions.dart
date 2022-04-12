import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/main_page_mod.dart';
import 'package:todo_app/core/shared_widgets/custom_icon_button.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';

class MainPageSliverAppBarListingModActions extends StatelessWidget {
  const MainPageSliverAppBarListingModActions({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: Icons.menu,
      onTap: () {
        context.providerOfMainPageController.setMainPageMod(MainPageMod.select);
      },
    );
  }
}
