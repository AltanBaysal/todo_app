import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/main_page_controller.dart';
import 'package:todo_app/screens/main_page/widgets/app_bar/main_page_app_bar_actions.dart';
import 'package:todo_app/screens/main_page/widgets/app_bar/main_page_app_bar_leading.dart';
import 'package:todo_app/screens/main_page/widgets/body/main_page_body.dart';
import 'package:todo_app/screens/main_page/widgets/main_page_floating_action_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! appbar ı farklı widget a koy
      //? appbar'ı farklı widget'a koymaya çalıştığımda PreferredSizeWidget diyor taşıttırmıyor 
      appBar: AppBar(
        leading: const MainPageAppBarLeading(),        
        actions: [
          Consumer<MainPageController>(
            builder: (
              BuildContext context,
              MainPageController value,
              Widget? child,
            ) {
              return MainPageAppBarActions(
                mainPageMod: value.mainPageMod,
              );
            },
          )
        ],
      ),

      floatingActionButton: const MainPageFloatingActionButton(),
      body: const MainPageBody(),
    );
  }
}


class A extends StatelessWidget implements PreferredSizeWidget{
  const A({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: const MainPageAppBarLeading(),        
        actions: [
          Consumer<MainPageController>(
            builder: (
              BuildContext context,
              MainPageController value,
              Widget? child,
            ) {
              return MainPageAppBarActions(
                mainPageMod: value.mainPageMod,
              );
            },
          )
        ],
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}