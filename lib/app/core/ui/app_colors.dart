import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static AppColors? _instance;

  static AppColors get i {
    _instance ??= AppColors._();
    return _instance!;
  }

  static const Color primary = Color(0xFF001464);
  static const Color gold = Color(0xFFd4af37);
  static const Color silver = Color(0xFFC0C0C0);
  static const Color bronze = Color(0xFFCD7F32);
}

extension AppColorsExtensions on BuildContext {
  AppColors get appColors => AppColors.i;
}
