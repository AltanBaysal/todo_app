import 'package:todo_app/core/constants/assets_constants.dart';
import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/core/enums/importance_level_enum.dart';

//! importancelevel extensionları aynı extension altına yaz diğerlerinide
extension ImportanceLevelEnumExtensions on ImportanceLevel {
  String get getImportanceLevelSvg {
    switch (this) {
      case ImportanceLevel.extreme:
        return Svgs.extremeImportanceLevelSvgs;
      case ImportanceLevel.very:
        return Svgs.veryImportanceLevelSvgs;
      case ImportanceLevel.pretty:
        return Svgs.prettyImportanceLevelSvgs;
      case ImportanceLevel.normal:
        return Svgs.normalImportanceLevelSvgs;
      case ImportanceLevel.less:
        return Svgs.lessImportanceLevelSvgs;
    }
  }

  String get getImportanceLevelText {
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

  List<String> get getAllImpotanceLevelText {
    return [
      EnglishTexts.importanceLevelExtreme,
      EnglishTexts.importanceLevelVery,
      EnglishTexts.importanceLevelPretty,
      EnglishTexts.importanceLevelNormal,
      EnglishTexts.importanceLevelLess
    ];
  }
}
