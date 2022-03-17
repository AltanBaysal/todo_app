import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/create_and_edit_task_controller.dart';
import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/core/enums/importance_level_enum.dart';
import 'package:todo_app/screens/helper/importance_level_enum_extensions.dart';

class CreateEditTaskPageBody extends StatelessWidget {
  const CreateEditTaskPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              vertical: height * 0.01, horizontal: width * 0.05),
          child: const TextField(
            decoration: InputDecoration(hintText: EnglishTexts.enterTitle),
          ),
        ),
        const DropDownMenu(),
        Container(
          margin: EdgeInsets.symmetric(
              vertical: height * 0.01, horizontal: width * 0.05),
          child: const TextField(
            decoration:
                InputDecoration(hintText: EnglishTexts.enterDescription),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: height * 0.04),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(EnglishTexts.create),
          ),
        ),
      ],
    );
  }
}

class DropDownMenu extends StatelessWidget {
  const DropDownMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: height * 0.01, horizontal: width * 0.05),
      child: Consumer<CreateAndEditTaskController>(
        builder: (
          BuildContext context,
          value,
          Widget? child,
        ) {
          return DropdownButton<String>(
            value: value.importanceLevelDropdownMenuValue,
            items: ImportanceLevel.values.map(buildMenuItem).toList(),
            onChanged:value.setimportanceLevelDropdownMenuValue, //mütiş kullanım,
          );
        },
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(ImportanceLevel importanceLevel) {
    return DropdownMenuItem(
      value: importanceLevel.getImportanceLevelText,
      child: Text(importanceLevel.getImportanceLevelText),
    );
  }
}
