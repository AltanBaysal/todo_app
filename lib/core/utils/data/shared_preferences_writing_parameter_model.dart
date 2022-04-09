
import 'package:todo_app/core/enums/shared_preferences_keys.dart';

class SharedPreferencesWritingParameterModel{
  final SharedPreferencesKeys _key;
  final dynamic _value;
  SharedPreferencesWritingParameterModel(this._key,this._value);

  String get key => _key.toString();
  dynamic get value => _value;
}