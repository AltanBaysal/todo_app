import 'package:todo_app/core/enums/importance_level_enum.dart';

//? bu iğrenç bir şey oldu ama böyle bir şey yazmam lazım enum yazılırken
//doğru yazıldığına emin olmak daha mantıksız gibi
List<ImportanceLevel> get importanceLevelValuesInImportanceOrder{
  return [
    ImportanceLevel.extreme,
    ImportanceLevel.very,
    ImportanceLevel.pretty,
    ImportanceLevel.normal,
    ImportanceLevel.less
  ];
}
