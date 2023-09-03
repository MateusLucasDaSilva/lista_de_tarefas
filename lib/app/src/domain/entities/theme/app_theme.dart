import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  final ThemeData defaultTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme(
      primary: AppColors.primary,
      onPrimary: AppColors.contrast,
      secondary: AppColors.secondary,
      onSecondary: AppColors.contrast,
      error: AppColors.error,
      onError: AppColors.contrast,
      background: AppColors.background,
      onBackground: AppColors.contrast,
      surface: AppColors.contrast,
      onSurface: AppColors.accentLightGray,
      shadow: AppColors.darkGrey,
      brightness: Brightness.light,
    ),
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      ),
      headlineMedium: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.text),
      labelLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.contrast),
      bodyLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.text,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
