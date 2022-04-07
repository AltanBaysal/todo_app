import 'package:todo_app/utils/shared_preferences_repository_implementation.dart';

//? içinde bütün init fonksiyonlarını içeriçek tek bir init fonksiyonu yazmak mantıklı mı?

void init(){
  SharedPreferencesRepositoryImplementation().init();
}