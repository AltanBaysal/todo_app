import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/main_page/main_page.dart';
import 'controllers/controllers_list.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todapp',
      home: MainPage(),
    );
  }
}
