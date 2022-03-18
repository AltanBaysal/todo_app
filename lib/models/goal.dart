import 'package:todo_app/core/enums/importance_level_enum.dart';

class Task {
  String title;
  String description;
  ImportanceLevel importanceLevel;
  DateTime deadLine;
  final DateTime creationDate = DateTime.now();
  final String id = DateTime.now().toString();
  bool isCompleted = false;

  Task({
    required this.title,
    required this.description,
    required this.importanceLevel,
    required this.deadLine,
  });

  Duration get taskTotalDuration => deadLine.difference(creationDate);
  Duration get remainDuration => deadLine.difference(DateTime.now());
}
