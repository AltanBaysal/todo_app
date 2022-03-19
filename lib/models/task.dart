import 'package:todo_app/core/enums/importance_level_enum.dart';
import 'package:uuid/uuid.dart';

class Task {
  String title;
  String description;
  ImportanceLevel importanceLevel;
  DateTime deadLine;
  final DateTime creationDate = DateTime.now();
  final String id = const Uuid().v1();
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
