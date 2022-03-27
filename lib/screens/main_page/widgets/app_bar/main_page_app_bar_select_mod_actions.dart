import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/main_page_mod.dart';
import 'package:todo_app/core/shared_widgets/icon_covered_gesture_detector.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';

class MainPageAppBarSelectModActions extends StatelessWidget {
  const MainPageAppBarSelectModActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          icon: Icons.delete,
          //? buradaki fonksiyonu direk eşitlemeyince patlıyor nedeni notfiy listener erken çalıştığı içinmiş ama tam anlamadım
          //? sorunu çözdüm ama nasıl çözdüğümü bende anlamadım 5 saat falan harcadım ya :(
          onTap: () {
            context.providerOfMainPageController
              ..deleteSelectedTasks()
              ..selectedTasks.clear()
              ..setMainPageMod(MainPageMod.listing);
          },
        ),
        CustomIconButton(
          icon: Icons.check,
          //? bu provider of lar için extension yazmamı istermisin böyle kötü gözüküyorlar
          onTap: () {
            context.providerOfMainPageController
              ..achieveSelectedTasks()
              ..selectedTasks.clear()
              ..setMainPageMod(MainPageMod.listing);
          },
        ),
        CustomIconButton(
          icon: Icons.close,
          onTap: () => context.providerOfMainPageController.setMainPageMod(MainPageMod.listing),
        ),
      ],
    );
  }
}
