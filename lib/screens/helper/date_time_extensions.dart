extension DateTimeExtensions on DateTime{
  String get minuteToText => minute.toString().padLeft(2,"0");
  String get hourToText => hour.toString().padLeft(2,"0");
  String get dayToText => day.toString().padLeft(2,"0");
  String get monthToText => month.toString().padLeft(2,"0");
  bool get isInPast => isBefore(DateTime.now());

  String get dateText {
    return "$dayToText/$monthToText/$year";
  }

  String get timeText {
    return "$hourToText:$minuteToText";
  }
}