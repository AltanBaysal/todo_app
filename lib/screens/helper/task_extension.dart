import 'package:todo_app/core/constants/assets_constants.dart';
import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/helper/importance_level_enum_extensions.dart';

extension TaskExtensions on Task{
  String get svg{
    if(isCompleted) return Svgs.achieveSvgs;
    return importanceLevel.importanceLevelSvg;
  }
}