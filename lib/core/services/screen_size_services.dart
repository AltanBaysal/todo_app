import 'package:flutter/material.dart';

class ScreenSizeService{
  double height;
  double width;

  ScreenSizeService._({required this.height, required this.width});

  static ScreenSizeService? instance;

  factory ScreenSizeService ({required BuildContext context}) {
    return instance ??= ScreenSizeService._(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
  }
}