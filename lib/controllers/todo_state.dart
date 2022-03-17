import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/importance_level_enum.dart';
import 'package:todo_app/screens/helper/get_importance_level_svg_extension.dart';
import '../models/goal.dart';

class TodoState with ChangeNotifier {
  final List<Goal> _goals = [
    Goal(
      title: "Do maths test",
      description: "description",
      importanceLevel: ImportanceLevel.extreme,
      executionDate: DateTime.now(),
    ),
    Goal(
      title: "title1",
      description: "description1",
      importanceLevel: ImportanceLevel.very,
      executionDate: DateTime.now(),
    ),
    Goal(
      title: "title2",
      description: "description2",
      importanceLevel: ImportanceLevel.pretty,
      executionDate: DateTime.now(),
    ),
    Goal(
      title: "title3",
      description: "description3",
      importanceLevel: ImportanceLevel.normal,
      executionDate: DateTime.now(),
    ),
    Goal(
      title: "title4",
      description: "description4",
      importanceLevel: ImportanceLevel.less,
      executionDate: DateTime.now(),
    ),
    Goal(
      title: "title5",
      description: "description5",
      importanceLevel: ImportanceLevel.normal,
      executionDate: DateTime.now(),
    ),
  ];

  List<Goal> get goals => _goals;
  //! otomatik sıralama yapılacak
  String getGoalImportanceLevelSvg(Goal goal) {
    return goal.importanceLevel.getImportanceLevelSvg();
  }
}
