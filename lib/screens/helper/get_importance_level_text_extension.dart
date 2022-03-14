import 'package:todo_app/constants/text_constants.dart';
import 'package:todo_app/enums/importance_level_enum.dart';

extension GetImportanceLevelTexts on ImportanceLevel {
  String getImportanceLevelTexts() {
    switch (this) {
      case ImportanceLevel.extreme:
        return EnglishTexts.importanceLevelextreme;
      case ImportanceLevel.very:
        return EnglishTexts.importanceLevelvery;
      case ImportanceLevel.pretty:
        return EnglishTexts.importanceLevelpretty;
      case ImportanceLevel.normal:
        return EnglishTexts.importanceLevelnormal;
      case ImportanceLevel.less:
        return EnglishTexts.importanceLevelless;
    }
  }
}
