import 'package:flutter/material.dart';

class GlobalBuildContextService {
  final BuildContext globalBuildContext;
  GlobalBuildContextService._(this.globalBuildContext);

  static GlobalBuildContextService? _instance;
  factory GlobalBuildContextService({BuildContext? globalContext}) {
    return _instance ??= globalContext != null
        ? GlobalBuildContextService._(globalContext)
        : throw Exception("globalContext have to initialize");
  }
}
