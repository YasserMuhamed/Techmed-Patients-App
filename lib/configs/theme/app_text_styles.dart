import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:techmed/core/helpers/extensions.dart';

import 'app_colors.dart';
import 'app_font_families.dart';
import 'app_font_weights.dart';
import 'app_text_size.dart';

class AppTextStyles {
  static Color textColor = AppColors.primaryText;

  static String getFontFamily(String fontFamily, Locale locale) {
    if (locale.languageCode == 'ar') {
      return AppFontFamilies.fontFamilyCairo;
    }
    return fontFamily;
  }

  // Base style to reuse common properties
  static TextStyle baseStyle({
    required String fontFamily,
    required FontWeight fontWeight,
    required double fontSize,
    FontStyle? fontStyle,
    BuildContext? context, // Add context
  }) {
    Locale locale =
        context != null
            ? Intl.getCurrentLocale().toLocale()
            : const Locale('en');
    return TextStyle(
      fontFamily: getFontFamily(fontFamily, locale),
      color: textColor,
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontStyle: fontStyle,
    );
  }

  // Poppins Styles
  static TextStyle poppins10Regular(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.regular,
    fontSize: AppTextSizes.fontSize10,
    context: context,
  );

  static TextStyle poppins10Medium(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.medium,
    fontSize: AppTextSizes.fontSize10,
    context: context,
  );

  static TextStyle poppins10SemiBold(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppTextSizes.fontSize10,
    context: context,
  );

  static TextStyle poppins10Bold(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.bold,
    fontSize: AppTextSizes.fontSize10,
    context: context,
  );

  static TextStyle poppins12Regular(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.regular,
    fontSize: AppTextSizes.fontSize12,
    context: context,
  );

  static TextStyle poppins12Medium(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.medium,
    fontSize: AppTextSizes.fontSize12,
    context: context,
  );

  static TextStyle poppins12SemiBold(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppTextSizes.fontSize12,
    context: context,
  );

  static TextStyle poppins12Bold(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.bold,
    fontSize: AppTextSizes.fontSize12,
    context: context,
  );

  static TextStyle poppins14Regular(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.regular,
    fontSize: AppTextSizes.fontSize14,
    context: context,
  );

  static TextStyle poppins14Medium(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.medium,
    fontSize: AppTextSizes.fontSize14,
    context: context,
  );

  static TextStyle poppins14SemiBold(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppTextSizes.fontSize14,
    context: context,
  );

  static TextStyle poppins14Bold(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.bold,
    fontSize: AppTextSizes.fontSize14,
    context: context,
  );

  static TextStyle poppins16Regular(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.regular,
    fontSize: AppTextSizes.fontSize16,
    context: context,
  );

  static TextStyle poppins16Medium(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.medium,
    fontSize: AppTextSizes.fontSize16,
    context: context,
  );

  static TextStyle poppins16SemiBold(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppTextSizes.fontSize16,
    context: context,
  );

  static TextStyle poppins16Bold(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.bold,
    fontSize: AppTextSizes.fontSize16,
    context: context,
  );

  static TextStyle poppins18Regular(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.regular,
    fontSize: AppTextSizes.fontSize18,
    context: context,
  );

  static TextStyle poppins18Medium(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.medium,
    fontSize: AppTextSizes.fontSize18,
    context: context,
  );

  static TextStyle poppins18SemiBold(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppTextSizes.fontSize18,
    context: context,
  );

  static TextStyle poppins18Bold(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.bold,
    fontSize: AppTextSizes.fontSize18,
    context: context,
  );

  static TextStyle poppins20Regular(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.regular,
    fontSize: AppTextSizes.fontSize20,
    context: context,
  );

  static TextStyle poppins20Medium(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.medium,
    fontSize: AppTextSizes.fontSize20,
    context: context,
  );

  static TextStyle poppins20SemiBold(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppTextSizes.fontSize20,
    context: context,
  );

  static TextStyle poppins20Bold(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.bold,
    fontSize: AppTextSizes.fontSize20,
    context: context,
  );
  static TextStyle poppins22Regular(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.regular,
    fontSize: AppTextSizes.fontSize22,
    context: context,
  );

  static TextStyle poppins22Medium(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.medium,
    fontSize: AppTextSizes.fontSize22,
    context: context,
  );

  static TextStyle poppins22SemiBold(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppTextSizes.fontSize22,
    context: context,
  );

  static TextStyle poppins22Bold(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.bold,
    fontSize: AppTextSizes.fontSize22,
    context: context,
  );

  static TextStyle poppins24Regular(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.regular,
    fontSize: AppTextSizes.fontSize24,
    context: context,
  );

  static TextStyle poppins24Medium(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.medium,
    fontSize: AppTextSizes.fontSize24,
    context: context,
  );

  static TextStyle poppins24SemiBold(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppTextSizes.fontSize24,
    context: context,
  );

  static TextStyle poppins24Bold(BuildContext context) => baseStyle(
    fontFamily: AppFontFamilies.fontFamilyPoppins,
    fontWeight: AppFontWeights.bold,
    fontSize: AppTextSizes.fontSize24,
    context: context,
  );
}
