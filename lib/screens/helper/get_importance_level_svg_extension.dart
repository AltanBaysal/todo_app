import 'package:todo_app/core/constants/assets_constants.dart';
import 'package:todo_app/core/enums/importance_level_enum.dart';

//! importancelevel extensionları aynı extension altına yaz diğerlerinide
extension GetImportanceLevelSvg on ImportanceLevel {
  String get getImportanceLevelSvg{
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
}
