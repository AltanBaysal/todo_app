import 'package:flutter/material.dart';

class DatePickerWidgetState extends StatelessWidget {
  const DatePickerWidgetState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return GestureDetector(
      onTap: () => pickDate(context),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: height * 0.01, horizontal: width * 0.05),
        child: Text(""),
      ),
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: initialDate,
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if(newDate == null) return;

    //? burada nasıl provider kullanabilir
    
  }
}
