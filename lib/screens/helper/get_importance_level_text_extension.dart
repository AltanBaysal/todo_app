import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/core/enums/importance_level_enum.dart';

extension GetImportanceLevelTexts on ImportanceLevel {
  String get getImportanceLevelTexts{
    switch (this) {
      case ImportanceLevel.extreme:
        return EnglishTexts.importanceLevelExtreme;
      case ImportanceLevel.very:
        return EnglishTexts.importanceLevelVery;
      case ImportanceLevel.pretty:
        return EnglishTexts.importanceLevelPretty;
      case ImportanceLevel.normal:
        return EnglishTexts.importanceLevelNormal;
      case ImportanceLevel.less:
        return EnglishTexts.importanceLevelLess;
    }
  }
}
