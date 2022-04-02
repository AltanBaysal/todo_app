import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/init/controller_list.dart';
import 'package:todo_app/core/services/global_build_context_services.dart';
import 'package:todo_app/screens/main_page/main_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: controllerList,
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GlobalBuildContextService(globalContext: context);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todapp',
      home: MainPage(),
    );
  }
}

//provider of u araştır
//eğer veride bir güncelleme olmayacaksa, widgetın tekrar çizilmesine gerek yoksa consumer kullanma!