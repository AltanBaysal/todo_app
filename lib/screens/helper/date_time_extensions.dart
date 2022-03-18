extension DateTimeExtensions on DateTime{
  String get minuteToText => minute.toString().padLeft(2,"0");
  String get hourToText => hour.toString().padLeft(2,"0");
  bool get isInPasT => isAfter(DateTime.now());
  //? bu isimlendirmeler nasıl ?
}