import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/create_and_edit_task_controller.dart';
import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/core/enums/importance_level_enum.dart';
import 'package:todo_app/screens/helper/get_importance_level_text_extension.dart';

class CreateEditTasksPage extends StatelessWidget {
  //*
  const CreateEditTasksPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                vertical: height * 0.01, horizontal: width * 0.05),
            child: const TextField(
              decoration: InputDecoration(hintText: EnglishTexts.enterTitle),
            ),
          ),
          
          Container(
            margin: EdgeInsets.symmetric(
                vertical: height * 0.01, horizontal: width * 0.05),
            child: Consumer<CreateAndEditTaskController>(
              builder: (_, value, __) => DropdownButton<String>(
                value: value.importanceLevelDropdownMenuValue,
                items: ImportanceLevel.values.map(buildMenuItem).toList(),
                onChanged: value.setimportanceLevelDropdownMenuValue//*,
              ),
            ),
          ),
          
          Container(
            margin: EdgeInsets.symmetric(
                vertical: height * 0.01, horizontal: width * 0.05),
            child: const TextField(
              decoration:
                  InputDecoration(hintText: EnglishTexts.enterDescription),
            ),
          ),
          
          Container(
            margin: EdgeInsets.only(top: height*0.04),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(EnglishTexts.create),
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(ImportanceLevel importanceLevel) {
    return DropdownMenuItem(
      value: importanceLevel.getImportanceLevelTexts(),
      child: Text(importanceLevel.getImportanceLevelTexts()),
      //? burda MediaQuery.of(context) kullanamıyorum
    );
  }
}
