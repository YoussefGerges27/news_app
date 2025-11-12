import 'package:flutter/material.dart';
import 'package:news_app/core/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      foregroundColor: AppColors.blackColor,
      centerTitle: true,
      scrolledUnderElevation: 0,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      foregroundColor: AppColors.whiteColor,
      centerTitle: true,
      scrolledUnderElevation: 0,
    ),
  );
}
