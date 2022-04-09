import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/init/controller_list.dart';
import 'package:todo_app/core/services/global_build_context_services.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/main_page/main_page.dart';
import 'package:todo_app/utils/shared_preferences_repository_implementation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  void initState(){
    super.initState();
    SharedPreferencesRepositoryImplementation().init();
  }
  @override
  Widget build(BuildContext context){
    context.providerOfMainPageController.init();  //? bunu init state e yazmak isterdim ama context malum, burası doğru yer mi?
    GlobalBuildContextService(globalContext: context);

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todapp',
      home: MainPage(),
    );
  }
}


//! any i araştır list için