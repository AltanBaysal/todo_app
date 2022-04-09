import 'package:todo_app/core/enums/importance_level_enum.dart';
import 'package:uuid/uuid.dart';


class Task {
  String title;
  String description;
  ImportanceLevel importanceLevel;
  DateTime deadLine;
  final DateTime _creationDate;
  final String _id;
  bool _isCompleted = false;

  Task({
    required this.title,
    required this.description,
    required this.importanceLevel,
    required this.deadLine,
  })  : _creationDate = DateTime.now(),
        _id = const Uuid().v1();
  //? bu iki nokta baya yararlı bir şey ne olduğunu tam anlamadım ama
  //! iki noktayı araştır

  DateTime get creationDate => _creationDate;
  Duration get totalDuration => deadLine.difference(creationDate);
  Duration get remainDuration => deadLine.difference(DateTime.now());
  String get id => _id;
  bool get isCompleted => _isCompleted;

  void setCompleted() => _isCompleted = true;
}
