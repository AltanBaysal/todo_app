import 'package:todo_app/core/enums/importance_level_enum.dart';

class Task {
  String title;
  String description;
  ImportanceLevel importanceLevel;
  DateTime executionDate;
  final DateTime creationDate = DateTime.now();
  final String id = DateTime.now().toString();
  bool isCompleted = false;

  Task({
    required this.title,
    required this.description,
    required this.importanceLevel,
    required this.executionDate,
  });

  Duration get taskTotalDuration => executionDate.difference(creationDate);
  Duration get remainDuration => executionDate.difference(DateTime.now());
}
