import 'package:todo_app/models/shared_preferences_deleting_parameter_model.dart';
import 'package:todo_app/models/shared_preferences_reading_parameter_model.dart';
import 'package:todo_app/models/shared_preferences_writing_parameter_model.dart';

abstract class SharedPreferencesRepository{
   Future<String?> read(SharedPreferencesReadingParameterModel paramater) async {} //? nullable string yapmadan fonksiyonun içini boş bırakarak yazabilir miyim?

   void write(SharedPreferencesWritingParameterModel paramater) async {}

   void delete(SharedPreferencesDeletingParameterModel paramater) async {}
}