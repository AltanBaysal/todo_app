import 'package:flutter/material.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';

//? buna daha kısa bir isim ?
class MainPageTaskListTileTextCoveredStadiumBorderedContainer
    extends StatelessWidget {
  const MainPageTaskListTileTextCoveredStadiumBorderedContainer({
    Key? key,
    this.color,
    this.title,
    required this.description,
  }) : super(key: key);

  final Color? color;
  final String? title;
  final String description;

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
            visible: title != null,
            child: Text(
              title!,
              style: TextStyle(fontSize: context.width * 0.028,color: Colors.grey[700]),
            ),
          ),
          Text(
            description,
            style: TextStyle(fontSize: context.width * 0.036,color: Colors.black),
          ),
        ],
      ),
    );
  }
}
