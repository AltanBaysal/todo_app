

extension DateTimeExtensions on DateTime{
  String get minuteToText => minute.toString().padLeft(2,"0");
  String get hourToText => hour.toString().padLeft(2,"0");
  //? bu isimlendirmeler nasıl ?
}