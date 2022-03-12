import 'package:todo_app/constants/text_constants.dart';
import 'package:todo_app/services/duration_in_week.dart';

String convertDurationToText(Duration duration) {
  if(duration.isNegative){
    return "Time Over";
  }
  
  if (duration.inWeeks > 6){
    return "${duration.inWeeks} ${EnglishTexts.abbreviationOfWeek}";
  }

  if (duration.inDays > 0){
    return "${duration.inDays} ${EnglishTexts.abbreviationOfDay}";
  }
    
  if (duration.inHours > 0){
    return "${duration.inHours} ${EnglishTexts.abbreviationOfHour}";
  }

  if (duration.inMinutes > 0){
    return "${duration.inMinutes} ${EnglishTexts.abbreviationOfMinutes}";
  }

  return "${duration.inSeconds} ${EnglishTexts.abbreviationOfSeconds}";
}
