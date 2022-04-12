import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/main_page_mod.dart';
import 'main_page_sliver_app_bar_normal_mode_actions.dart';
import 'main_page_sliver_app_bar_select_mod_actions.dart';


class MainPageSliverAppBarActions extends StatelessWidget {
  const MainPageSliverAppBarActions({
    Key? key,
    required this.mainPageMod
  }) : super(key: key);

  final MainPageMod mainPageMod;

  @override
  Widget build(BuildContext context) {
    switch (mainPageMod) {
      case MainPageMod.select:
        return const MainPageSliverAppBarSelectModActions();
      case MainPageMod.listing:
        return const MainPageSliverAppBarListingModActions();
    }
  }
}
