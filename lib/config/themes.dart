import 'package:flutter/material.dart';
import 'package:qcraft/core/constants/app_colors.dart';

class AppTheme {
  static final mainTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.bg,
    useMaterial3: true,
    cardColor: AppColors.shade100,
    fontFamily: "ProximaNova",
    // chipTheme: ChipThemeData(),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: AppColors.bg),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle: TextStyle(
          color: AppColors.white,
        ),
      ),
    ),
  );
}
