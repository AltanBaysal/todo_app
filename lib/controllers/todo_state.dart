import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/importance_level_enum.dart';
import '../models/goal.dart';

class TodoState with ChangeNotifier {
  final List<Task> _goals = [
    Task(
      title: "Do maths test",
      description: "description",
      importanceLevel: ImportanceLevel.extreme,
      executionDate: DateTime.now(),
    ),
    Task(
      title: "title1",
      description: "description1",
      importanceLevel: ImportanceLevel.very,
      executionDate: DateTime.now(),
    ),
    Task(
      title: "title2",
      description: "description2",
      importanceLevel: ImportanceLevel.pretty,
      executionDate: DateTime.now(),
    ),
    Task(
      title: "title3",
      description: "description3",
      importanceLevel: ImportanceLevel.normal,
      executionDate: DateTime.now(),
    ),
    Task(
      title: "title4",
      description: "description4",
      importanceLevel: ImportanceLevel.less,
      executionDate: DateTime.now(),
    ),
    Task(
      title: "title5",
      description: "description5",
      importanceLevel: ImportanceLevel.normal,
      executionDate: DateTime.now(),
    ),
  ];

  List<Task> get goals => _goals;
  //! otomatik sıralama yapılacak
}
