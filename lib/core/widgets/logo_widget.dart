import 'package:flutter/material.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';

class LogoText extends StatelessWidget {
  const LogoText({super.key, required this.fontSize});

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'TECH',
              style: AppTextStyles.poppins16Medium(
                context,
              ).copyWith(fontSize: fontSize),
            ),
            TextSpan(
              text: 'MED',
              style: AppTextStyles.poppins16Medium(
                context,
              ).copyWith(fontSize: fontSize, color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
