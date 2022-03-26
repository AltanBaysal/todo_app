import 'package:flutter/material.dart';
import 'package:todo_app/core/services/screen_size_services.dart';

extension ContextExtension on BuildContext{
  double get height => ScreenSizeService(context: this).height;
  double get width => ScreenSizeService(context: this).width;
}