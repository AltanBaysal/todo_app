import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/shared_preferences_reading_parameter_model.dart';
import 'package:todo_app/models/shared_preferences_deleting_parameter_model.dart';
import 'package:todo_app/models/shared_preferences_writing_parameter_model.dart';
import 'package:todo_app/utils/shared_preferences_repository.dart';

class SharedPreferencesRepositoryImplementation implements SharedPreferencesRepository{
  
  SharedPreferencesRepositoryImplementation._();

  static SharedPreferencesRepositoryImplementation? _instance;

  factory SharedPreferencesRepositoryImplementation(){
    return _instance ??= SharedPreferencesRepositoryImplementation._();
  }
  
  //? metodlar static yazmaya çalıştığımda başka dosyadan implement ettiğim için sıkıntı çıkıyor araştırdığıma göre yapılması doğru bir şey değilmiş
  // o yüzden singelton olarak yazdım

  late final SharedPreferences _preferences;

  Future init() async => _preferences = await SharedPreferences.getInstance();

  @override
  Future<void> delete(SharedPreferencesDeletingParameterModel paramater) async {
    await _preferences.remove(paramater.key);
  }

  @override
  String? read(SharedPreferencesReadingParameterModel paramater) {
    //? burayı bir tık geliştirdim
    String? value = _preferences.getString(paramater.key);
    if(value == null) throw Exception("Value not found");
    return value;
  }

  @override
  Future<void> write(SharedPreferencesWritingParameterModel paramater) async {
    await _preferences.setString(paramater.key, paramater.value);
  }

}