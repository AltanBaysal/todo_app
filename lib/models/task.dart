import 'package:todo_app/core/enums/importance_level_enum.dart';
import 'package:uuid/uuid.dart';

// bunuda utils'e taşımamı ister misin?
class Task {
  String title;
  String description;
  ImportanceLevel importanceLevel;
  DateTime deadLine;
  final DateTime _creationDate;
  final String _id;
  bool _isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.importanceLevel,
    required this.deadLine,
  })  : _creationDate = DateTime.now(),
        _id = const Uuid().v1(),
        _isCompleted = false;
  //! iki noktayı araştır

  DateTime get creationDate => _creationDate;
  Duration get totalDuration => deadLine.difference(creationDate);
  Duration get remainDuration => deadLine.difference(DateTime.now());
  String get id => _id;
  bool get isCompleted => _isCompleted;

  void setCompleted() => _isCompleted = true;

  Task.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        description = json["description"],
        importanceLevel = ImportanceLevel.values[json["importanceLevel"]],
        deadLine = DateTime.parse( json["deadLine"]), 
        _creationDate = DateTime.fromMillisecondsSinceEpoch(json["_creationDate"]),
        _id = json["_id"],
        _isCompleted = json["_isCompleted"];

  Map<String,dynamic> get toJson => {
    "title" : title,
    "description" : description,
    "importanceLevel" : importanceLevel.index,
    "deadLine" : deadLine.toIso8601String(),
    "_creationDate" : _creationDate.millisecondsSinceEpoch,
    "_id" :_id ,
    "_isCompleted" : _isCompleted,
  };
}

//ikiside doğru kullanım ıso8601 localizasyonda sıkıntı yaşıyor, millisecondsinceepoch ise performans olarak daha kötü