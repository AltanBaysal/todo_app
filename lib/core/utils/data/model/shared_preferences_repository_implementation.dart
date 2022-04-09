import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/utils/data/model/shared_preferences_deleting_parameter_model.dart';
import 'package:todo_app/core/utils/data/model/shared_preferences_reading_parameter_model.dart';
import 'package:todo_app/core/utils/domain/shared_preferences_repository.dart';

import '../shared_preferences_writing_parameter_model.dart';

class SharedPreferencesRepositoryImplementation implements SharedPreferencesRepository{
  
  SharedPreferencesRepositoryImplementation._();

  static SharedPreferencesRepositoryImplementation? _instance;

  factory SharedPreferencesRepositoryImplementation(){
    return _instance ??= SharedPreferencesRepositoryImplementation._();
  }

  late final SharedPreferences _preferences;

  Future init() async => _preferences = await SharedPreferences.getInstance();

  @override
  Future<void> delete(SharedPreferencesDeletingParameterModel paramater) async {
    await _preferences.remove(paramater.key); //! nasıl çalıştığını araştır
  }

  @override
  String? read(SharedPreferencesReadingParameterModel paramater) {
    return _preferences.getString(paramater.key);
  }

  @override
  Future<void> write(SharedPreferencesWritingParameterModel paramater) async {
    await _preferences.setString(paramater.key, paramater.value);
  }
}