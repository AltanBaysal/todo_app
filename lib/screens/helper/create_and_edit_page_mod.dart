import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/core/enums/create_and_edit_task_page_mod.dart';

extension CreateAndEditPageModExtension on CreateAndEditPageMod{
  String get text{
    switch (this) {
      case CreateAndEditPageMod.create: return EnglishTexts.create;
      case CreateAndEditPageMod.edit: return EnglishTexts.edit;
    }
  }
}