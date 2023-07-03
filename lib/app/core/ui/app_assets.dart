import 'package:flutter/material.dart';

class AppAssets {
  AppAssets._();
  static AppAssets? _instance;

  static AppAssets get i {
    _instance ??= AppAssets._();
    return _instance!;
  }

  static const String scaled = 'assets/images/scaled.png';
  static const String rx = 'assets/images/rx.png';
  static const String elite = 'assets/images/elite.png';
  static const String elite2 = 'assets/images/elite2.png';
}

extension AppAssetsExtensions on BuildContext {
  AppAssets get appAssets => AppAssets.i;
}
