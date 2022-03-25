import 'package:flutter/material.dart';

//? isimlendirme olmamış gibi

//? bu constants a koymam gerekiyor ama orda nereye koymam gerekiyor çözemedim
class ContextHeightWidth{
  double height;
  double width;

  ContextHeightWidth._({required this.height, required this.width});

  static ContextHeightWidth? instance;

  factory ContextHeightWidth ({required BuildContext context}) {
    return instance ??= ContextHeightWidth._(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
  }
}




extension ContextExtension on BuildContext{
  double get height => ContextHeightWidth(context: this).height;
  double get width => ContextHeightWidth(context: this).width;
}