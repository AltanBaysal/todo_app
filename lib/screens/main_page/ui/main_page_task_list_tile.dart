import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/todo_state.dart';
import 'package:todo_app/screens/helper/duration_text_converter.dart';

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
      title: MainPageTaskListTileTitle(index: index),
      children: [ //! burayı bir kere düzenle
        Consumer<TodoState>(
          builder: (_, value, __) => Text(
            "Importance Level : ${value.goals[index].importanceLevel.toString()}",
            softWrap: true,
            style: TextStyle(fontSize: width * 0.04),
          ),
        ),

        Consumer<TodoState>(
          builder: (_, value, __) => Text(
            "Creation Date : ${value.goals[index].creationDate.toString().substring(0, 16)}",
            softWrap: true,
            style: TextStyle(fontSize: width * 0.04),
          ),
        ),

        Consumer<TodoState>(
          builder: (_, value, __) => Text(
            "Deadline : ${value.goals[index].executionDate.toString().substring(0, 16)}",
            softWrap: true,
            style: TextStyle(fontSize: width * 0.04),
          ),
        ),

        Consumer<TodoState>(
          builder: (_, value, __) => Text(
            "Total Task Duration : ${convertDurationToText(value.goals[index].taskTotalDuration)}",
            softWrap: true,
            style: TextStyle(fontSize: width * 0.04),
          ),
        ),

        Consumer<TodoState>(
          builder: (_, value, __) => Text(
            "Remain Duration : ${convertDurationToText(value.goals[index].remainDuration)}",
            softWrap: true,
            style: TextStyle(fontSize: width * 0.04),
          ),
        ),

        Consumer<TodoState>(
          builder: (_, value, __) => Text(
            "Description : ${value.goals[index].description}",
            softWrap: true,
            style: TextStyle(fontSize: width * 0.04),
          ),
        ),
      ],
    );
  }
}

class MainPageTaskListTileTitle extends StatelessWidget {
  const MainPageTaskListTileTitle({Key? key, required this.index})
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
            SizedBox(
              height: height * 0.05,
              width: height * 0.05,
              child: Consumer<TodoState>(
                builder: (_, value, __) => SvgPicture.asset(
                  value.getGoalImportanceLevelSvgs(value.goals[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: width * 0.03),
              child: Consumer<TodoState>(
                builder: (_, value, __) => Text(
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
              convertDurationToText(value.goals[index].remainDuration),
            ),
          ),
        ),
      ],
    );
  }
}
