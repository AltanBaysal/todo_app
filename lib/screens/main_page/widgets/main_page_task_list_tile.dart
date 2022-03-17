import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/todo_state.dart';
import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/core/shared_widgets/svg_covered_sized_box.dart';
import 'package:todo_app/screens/helper/duration_text_converter_extension.dart';

class MainPageTaskListTile extends StatelessWidget {
  const MainPageTaskListTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ExpansionTile(
      expandedAlignment: Alignment.topLeft,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: EdgeInsets.symmetric(
          horizontal: width * 0.06, vertical: height * 0.01),
      title: _MainPageTaskListTileTitle(index: index),
      children: [
        //? aynı şeyi sürekli tekrar ediyorum consumer saolsun içinden çıkamadım
        Consumer<TodoState>(
          builder: (_, value, __) => Text(
            "${EnglishTexts.importanceLevel} : ${value.goals[index].importanceLevel.toString()}",
            softWrap: true,
            style: TextStyle(fontSize: width * 0.04),
          ),
        ),

        Consumer<TodoState>(
          builder: (_, value, __) => Text(
            "${EnglishTexts.creationDate} : ${value.goals[index].creationDate.toString().substring(0, 16)}",
            softWrap: true,
            style: TextStyle(fontSize: width * 0.04),
          ),
        ),

        Consumer<TodoState>(
          builder: (_, value, __) => Text(
            "${EnglishTexts.deadline} : ${value.goals[index].executionDate.toString().substring(0, 16)}",
            softWrap: true,
            style: TextStyle(fontSize: width * 0.04),
          ),
        ),

        Consumer<TodoState>(
          builder: (_, value, __) => Text(
            "${EnglishTexts.totalTaskDuration} : ${value.goals[index].taskTotalDuration.convertDurationToText()}",
            softWrap: true,
            style: TextStyle(fontSize: width * 0.04),
          ),
        ),

        Consumer<TodoState>(
          builder: (_, value, __) => Text(
            "${EnglishTexts.remainDuration} : ${value.goals[index].remainDuration.convertDurationToText()}",
            softWrap: true,
            style: TextStyle(fontSize: width * 0.04),
          ),
        ),

        Consumer<TodoState>(
          builder: (_, value, __) => Text(
            "${EnglishTexts.description} : ${value.goals[index].description}",
            softWrap: true,
            style: TextStyle(fontSize: width * 0.04),
          ),
        ),
      
      ],
    );
  }
}


class _MainPageTaskListTileTitle extends StatelessWidget {
  const _MainPageTaskListTileTitle({Key? key, required this.index})
      : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Consumer<TodoState>(
              builder: (_, value, __) => SvgCoveredSizedBox(
                height: height * 0.05,
                width: height * 0.05,
                svgAssets: value.getGoalImportanceLevelSvg(value.goals[index]),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: width * 0.03),
              child: Consumer<TodoState>(
                //! bütün builderları aşağıdaki şekilde oluştur 
                builder: (BuildContext context,TodoState value, Widget? child) => Text(
                  value.goals[index].title,
                  style: TextStyle(fontSize: width * 0.045),
                ),
              ),
            ),
          ],
        ),

        Container(
          margin: EdgeInsets.only(left: width * 0.02),
          child: Consumer<TodoState>(
            builder: (_, value, __) => Text(
              (value.goals[index].remainDuration.convertDurationToText()),
            ),
          ),
        ),
      ],
    );
  }
}
