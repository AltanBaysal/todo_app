import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/init/controller_list.dart';
import 'package:todo_app/core/services/global_build_context_services.dart';
import 'package:todo_app/screens/main_page/main_page.dart';
import 'core/utils/data/model/shared_preferences_repository_implementation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesRepositoryImplementation().init();
  runApp(
    MultiProvider(
      providers: controllerList,
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context){
    GlobalBuildContextService(globalContext: context);

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todapp',
      home: MainPage(),
    );
  }
}

//? uygulama açılırken svgler biraz geç geliyor o sorunu nasıl çözebilirim ? 
//precacheImage(AssetImage("images/logo_rienpa.png"), context); kullanmak mantıklı mı?

//! any i araştır list için
//! sliver app bar ekle