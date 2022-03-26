import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/todo_state.dart';
import 'package:todo_app/core/enums/main_page_mod.dart';
import 'package:todo_app/core/shared_widgets/icon_covered_gesture_detector.dart';

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
            Provider.of<MainPageController>(
              context,
              listen: false,
            )
              ..deleteSelectedTasks()
              ..selectedTasks.clear()
              ..setMainPageMod(MainPageMod.listing);
          },
        ),
        CustomIconButton(
          icon: Icons.check,
          //? bu provider of lar için extension yazmamı istermisin böyle kötü gözüküyorlar
          onTap: () {
            Provider.of<MainPageController>(
              context,
              listen: false,
            )
              ..achieveSelectedTasks()
              ..selectedTasks.clear()
              ..setMainPageMod(MainPageMod.listing);
          },
        ),
        CustomIconButton(
          icon: Icons.close,
          onTap: () => Provider.of<MainPageController>(
            context,
            listen: false,
          ).setMainPageMod(MainPageMod.listing),
        ),
      ],
    );
  }
}
