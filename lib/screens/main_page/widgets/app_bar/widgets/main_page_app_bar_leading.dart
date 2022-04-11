import 'package:flutter/material.dart';
import 'package:todo_app/core/shared_widgets/custom_icon_button.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';

class MainPageAppBarLeading extends StatelessWidget {
  const MainPageAppBarLeading({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: Icons.share,
      onTap: () => context.providerOfMainPageController.toggleTaskSortType(),
    );
  }
}