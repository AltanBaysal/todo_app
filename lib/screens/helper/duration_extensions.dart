import 'package:todo_app/core/constants/text_constants.dart';

extension DurationExtensions on Duration {
  String get text{
    if (isNegative) {
      return EnglishTexts.timeOver;
    }

    if (inDays > 6) {
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

  int get inWeeks => (inDays/7).floor();
}
