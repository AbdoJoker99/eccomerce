import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData mainTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.whiteColor,
      ), // TextStyle
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.whiteColor,
      ), // TextStyle
    ),
  );
}
