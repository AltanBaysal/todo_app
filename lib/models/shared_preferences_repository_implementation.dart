import 'package:todo_app/models/shared_preferences_reading_parameter_model.dart';
import 'package:todo_app/models/shared_preferences_deleting_parameter_model.dart';
import 'package:todo_app/models/shared_preferences_repository.dart';
import 'package:todo_app/models/shared_preferences_writing_parameter_model.dart';

class SharedPreferencesRepositoryImplementation implements SharedPreferencesRepository{
  @override
  void delete(SharedPreferencesDeletingParameterModel paramater) {
    // TODO: implement delete
  }

  @override
  Future<String?> read(SharedPreferencesReadingParameterModel paramater) async{}

  @override
  void write(SharedPreferencesWritingParameterModel paramater) {
    // TODO: implement write
  }

}