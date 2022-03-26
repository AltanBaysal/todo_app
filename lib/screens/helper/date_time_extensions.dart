extension DateTimeExtensions on DateTime{
  String get minuteToText => minute.toString().padLeft(2,"0");
  String get hourToText => hour.toString().padLeft(2,"0");
  bool get isInPast => isBefore(DateTime.now());

  String get dateText {
    return "$year/$month/$day";
  }

  String get timeText {
    return "$hourToText:$minuteToText";
  }
}