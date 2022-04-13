import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/main_page_controller.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';

class MainPageTaskInfoBubble
    extends StatelessWidget {
  const MainPageTaskInfoBubble({
    Key? key,
    this.color,
    this.label,
    required this.selector,
  }) : super(key: key);

  final Color? color;
  final String? label;
  final String Function(BuildContext, MainPageController) selector;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.width * 0.02,
        vertical: context.height * 0.01,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.03,
        vertical: context.height * 0.013,
      ),
      decoration: ShapeDecoration(
        color: color ?? Colors.grey[200],
        shape: const StadiumBorder(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: label != null,
            child: Text(
              label!,
              style: TextStyle(
                  fontSize: context.width * 0.028, color: Colors.grey[700]),
            ),
          ),
          //! düzenle
          //? bu kullanım mantıklı mı sırf sadece text'i düzeltsin ve her yerde selector yazılmasın diye kurtuluş savaşı verdim resmen
          Selector<MainPageController, String>(
            selector: selector,
            builder: (BuildContext context, value, Widget? child) {
              return Text(
                value,
                style: TextStyle(
                  fontSize: context.width * 0.036,
                  color: Colors.black,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
