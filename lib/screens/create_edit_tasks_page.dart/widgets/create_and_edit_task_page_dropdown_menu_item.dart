import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/importance_level_enum.dart';
import 'package:todo_app/core/shared_widgets/svg_covered_sized_box.dart';
import 'package:todo_app/screens/helper/importance_level_enum_extensions.dart';

class CreateAndEditPageDropdownMenuItem extends StatelessWidget {
  const CreateAndEditPageDropdownMenuItem({
    Key? key,
    required this.importanceLevel,
  }) : super(key: key);

  final ImportanceLevel importanceLevel;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SvgCoveredSizedBox(
          height: width * 0.08,
          width: width * 0.08,
          svgAssets: importanceLevel.importanceLevelSvg,
        ),
        SizedBox(
          width: width * 0.03,
        ),
        Text(
          importanceLevel.importanceLevelText,
          style: TextStyle(
            fontSize: width * 0.04,
          ),
        ),
      ],
    );
  }
}
