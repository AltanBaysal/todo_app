import 'package:todo_app/constants/assets_constants.dart';
import 'package:todo_app/enums/importance_level_enum.dart';
  //? bunları extension yapma mı ister misin?
String getImportanceLevelSvgs(ImportanceLevel importanceLevel) {
  switch (importanceLevel) {
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
