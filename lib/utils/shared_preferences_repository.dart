import 'package:todo_app/models/shared_preferences_deleting_parameter_model.dart';
import 'package:todo_app/models/shared_preferences_reading_parameter_model.dart';
import 'package:todo_app/models/shared_preferences_writing_parameter_model.dart';

abstract class SharedPreferencesRepository{
   String? read(SharedPreferencesReadingParameterModel paramater){}

   void write(SharedPreferencesWritingParameterModel paramater) async {}

   void delete(SharedPreferencesDeletingParameterModel paramater) async {}
}