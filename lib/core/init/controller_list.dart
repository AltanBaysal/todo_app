import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todo_app/controllers/create_and_edit_task_controller.dart'; 
import 'package:todo_app/controllers/main_page_controller.dart';


List<SingleChildWidget> controllerList = [ 
  ChangeNotifierProvider<MainPageController>(create: (BuildContext context) => MainPageController()),
  ChangeNotifierProvider<CreateAndEditTaskController>(create: (BuildContext context) => CreateAndEditTaskController()),
];

