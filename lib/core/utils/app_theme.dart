import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
    canvasColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      actionsPadding: EdgeInsetsDirectional.only(end: 24.sp),
      backgroundColor: AppColors.whiteColor,
      foregroundColor: AppColors.blackColor,
      centerTitle: true,
      scrolledUnderElevation: 0,
      titleTextStyle: AppStyles.medium20Black,
      leadingWidth: 14.w,
    ),
    textTheme: TextTheme(
      headlineLarge: AppStyles.medium24Black,
      headlineMedium: AppStyles.medium24White,
      headlineSmall: AppStyles.bold16Black,
      bodyLarge: AppStyles.medium14White,
      bodyMedium: AppStyles.medium20Black,
    ),
    tabBarTheme: TabBarThemeData(
      labelStyle: AppStyles.bold16Black,
      unselectedLabelStyle: AppStyles.medium14Black,
      indicatorColor: AppColors.blackColor,
      indicatorSize: TabBarIndicatorSize.tab,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.blackColor,
    canvasColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      foregroundColor: AppColors.whiteColor,
      centerTitle: true,
      scrolledUnderElevation: 0,
      titleTextStyle: AppStyles.medium20White,
      leadingWidth: 14.w,
    ),
    textTheme: TextTheme(
      headlineLarge: AppStyles.medium24White,
      headlineMedium: AppStyles.medium24Black,
      headlineSmall: AppStyles.bold16White,
      bodyLarge: AppStyles.medium14Black,
      bodyMedium: AppStyles.medium20White,
    ),
    tabBarTheme: TabBarThemeData(
      labelStyle: AppStyles.bold16White,
      unselectedLabelStyle: AppStyles.medium14White,
      indicatorColor: AppColors.whiteColor,
      indicatorSize: TabBarIndicatorSize.tab,
    ),
  );
}
