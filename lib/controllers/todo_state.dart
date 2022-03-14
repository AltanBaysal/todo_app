import 'package:flutter/material.dart';
import 'package:todo_app/enums/importance_level_enum.dart';
import 'package:todo_app/screens/helper/get_importance_level_svg_extension.dart';
import '../models/goal.dart';

class TodoState with ChangeNotifier{
  final List<Goal> _goals =[
    Goal("Do maths test", "description", ImportanceLevel.extreme, DateTime.now()),
    Goal("title1", "description1", ImportanceLevel.very, DateTime.now()),
    Goal("title2", "description2", ImportanceLevel.pretty, DateTime.now()),
    Goal("title3", "description3", ImportanceLevel.normal, DateTime.now()),
    Goal("title4", "description4", ImportanceLevel.less, DateTime.now()),
    Goal("title5", "description5", ImportanceLevel.normal, DateTime.now()),
  ];

  List<Goal> get goals => _goals;
  //! otomatik sıralama yapılacak
  String getGoalImportanceLevelSvgs(Goal goal){
    return goal.importanceLevel.getImportanceLevelSvgs();
  }
}