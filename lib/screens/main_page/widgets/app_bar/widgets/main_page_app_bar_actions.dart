import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/main_page_mod.dart';
import 'main_page_app_bar_normal_mode_actions.dart';
import 'main_page_app_bar_select_mod_actions.dart';


class MainPageAppBarActions extends StatelessWidget {
  const MainPageAppBarActions({
    Key? key,
    required this.mainPageMod
  }) : super(key: key);

  final MainPageMod mainPageMod;

  @override
  Widget build(BuildContext context) {
    switch (mainPageMod) {
      case MainPageMod.select:
        return const MainPageAppBarSelectModActions();
      case MainPageMod.listing:
        return const MainPageAppBarListingModActions();
    }
  }
}
