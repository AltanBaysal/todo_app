import 'package:todo_app/core/enums/shared_preferences_keys.dart';

class SharedPreferencesDeletingParameterModel{
  final SharedPreferencesKeys _key;
  SharedPreferencesDeletingParameterModel(this._key);
  String get key => _key.toString();
}