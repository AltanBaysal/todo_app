
import 'package:todo_app/core/enums/shared_preferences_keys.dart';

class SharedPreferencesReadingParameterModel{
  final SharedPreferencesKeys _key;//? bunu enum haline getirdim string yerine 
  SharedPreferencesReadingParameterModel(this._key);
  String get key => _key.toString();
}