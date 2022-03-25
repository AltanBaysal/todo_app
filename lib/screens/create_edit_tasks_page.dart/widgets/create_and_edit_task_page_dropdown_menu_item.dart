import 'package:flutter/material.dart';
import 'package:todo_app/core/enums/importance_level_enum.dart';
import 'package:todo_app/core/shared_widgets/svg_covered_sized_box.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';
import 'package:todo_app/screens/helper/importance_level_enum_extensions.dart';

class CreateAndEditPageDropdownMenuItem extends StatelessWidget {
  const CreateAndEditPageDropdownMenuItem({
    Key? key,
    required this.importanceLevel,
  }) : super(key: key);

  final ImportanceLevel importanceLevel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgCoveredSizedBox(
          height: context.width * 0.08,
          width: context.width * 0.08,
          svgAssets: importanceLevel.importanceLevelSvg,
        ),
        SizedBox(
          width: context.width * 0.03,
        ),
        Text(
          importanceLevel.importanceLevelText,
          style: TextStyle(
            fontSize: context.width * 0.04,
          ),
        ),
      ],
    );
  }
}
