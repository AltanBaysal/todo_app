import 'package:todo_app/enums/importance_level_enum.dart';

class Goal{
  String _title;
  String _description;
  ImportanceLevel _importanceLevel;
  DateTime _executionDate; 
  final DateTime _creationDate = DateTime.now();
  final String _id = DateTime.now().toString(); //? bunu kullanmak mantıklı mı yoksa direkt creation date mi kullanayım bunun yerine
  bool _isCompleted = false;


  Goal(this._title,this._description,this._importanceLevel,this._executionDate); //? isimlendirilmiş constructor olayını hala çözemedim :(


  String get id => _id;
  String get title => _title;
  String get description => _description;

  ImportanceLevel get importanceLevel => _importanceLevel;

  DateTime get executionDate => _executionDate;
  DateTime get creationDate => _creationDate;

  bool get isCompleted => _isCompleted;

  Duration get taskTotalDuration => _executionDate.difference(_creationDate); //? bu fonksiyonların burda olması doğru mu?
  Duration get remainDuration => _executionDate.difference(DateTime.now());


  void setTitle({required String title}){
    _title = title;
  }

  void setDescription({required String description}){
    _description = description;
  }

  void setImportanceLevel({required ImportanceLevel importanceLevel}){
    _importanceLevel = importanceLevel;
  }

  void setExecutionDate({required executionDate}){
    _executionDate = executionDate;
  }

  void setIsCompleted({required isCompleted}){
    _isCompleted = isCompleted;
  }
}