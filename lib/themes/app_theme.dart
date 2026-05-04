import 'package:ember/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(primary: AppColors.primary),
  );
}
