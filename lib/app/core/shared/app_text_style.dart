import 'package:flutter/material.dart';

import '../app_colors.dart';
import 'app_constantes.dart';



class AppTextStyles {
  const AppTextStyles._();

  static const titleLarge = TextStyle(
      fontSize: 24,
      fontFamily: AppConstants.outfitFontFamily,
      fontWeight: FontWeight.w700,
      color: AppColors.blackText
  );

  static const titleMedium = TextStyle(
      fontSize: 20,
      fontFamily: AppConstants.outfitFontFamily,
      fontWeight: FontWeight.w700,
      color: AppColors.blackText
  );

  static const titleCategory = TextStyle(
      fontSize: 16,
      fontFamily: AppConstants.outfitFontFamily,
      fontWeight: FontWeight.w400,
      color: AppColors.blackText
  );

  static const labelInputText = TextStyle(
      fontSize: 16,
      fontFamily: AppConstants.outfitFontFamily,
      fontWeight: FontWeight.w600,
      color: AppColors.blackText
  );

  static const titleAppBar = TextStyle(
      fontSize: 18,
      fontFamily: AppConstants.outfitFontFamily,
      fontWeight: FontWeight.w700,
      color: AppColors.blackText
  );
  static const labelMedium = TextStyle(
    fontSize: 14,
    fontFamily: AppConstants.outfitFontFamily,
    fontWeight: FontWeight.w400,
  );

  static const bodyMedium = TextStyle(
    fontSize: 12,
    fontFamily: AppConstants.outfitFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.subtitleText,
  );
  static const bodySmall = TextStyle(
    fontSize: 10,
    fontFamily: AppConstants.outfitFontFamily,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static final appBarTitle = AppTextStyles.titleMedium.copyWith(
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  );
}
