import 'package:todo_app/core/constants/text_constants.dart';
import 'package:todo_app/screens/helper/duration_in_week.dart';

extension ConvertDurationToText on Duration {
  //*extension get
  String get convertDurationToText{
    if (isNegative) {
      return "Time Over";
    }

    if (inWeeks > 6) {
      return "$inWeeks ${EnglishTexts.abbreviationOfWeek}";
    }

    if (inDays > 0) {
      return "$inDays ${EnglishTexts.abbreviationOfDay}";
    }

    if (inHours > 0) {
      return "$inHours ${EnglishTexts.abbreviationOfHour}";
    }

    if (inMinutes > 0) {
      return "$inMinutes ${EnglishTexts.abbreviationOfMinutes}";
    }

    return "$inSeconds ${EnglishTexts.abbreviationOfSeconds}";
  }
}
