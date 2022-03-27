import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/create_and_edit_task_controller.dart';
import 'package:todo_app/controllers/main_page_controller.dart';
import 'package:todo_app/core/services/screen_size_services.dart';

extension ContextExtension on BuildContext{
  double get height => ScreenSizeService(context: this).height;
  double get width => ScreenSizeService(context: this).width;

  //? kullanmak mantıklı mı
  MainPageController get providerOfMainPageController => Provider.of<MainPageController>(this,listen: false,);
  CreateAndEditTaskController get providerOfCreateAndEditTaskController => Provider.of<CreateAndEditTaskController>(this,listen: false,);
}