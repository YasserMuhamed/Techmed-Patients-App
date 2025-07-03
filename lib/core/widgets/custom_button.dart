import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_paddings.dart';
import 'package:techmed/configs/theme/app_strokes.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? width;
  final Color? bgColor;
  final double? xPadding;
  final double? yPadding;
  final TextStyle? textStyle;
  final bool isLoading;
  final Function()? onPressed;

  const CustomButton({
    super.key,
    this.width,
    this.bgColor,
    this.xPadding,
    this.yPadding,
    this.textStyle,
    this.isLoading = false,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor ?? AppColors.primaryColor,
          padding: EdgeInsets.symmetric(
            horizontal: xPadding != null ? xPadding!.w : AppPaddings.gap8,
            vertical: yPadding != null ? yPadding!.h : AppPaddings.gap12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(color: AppColors.transparent, width: 1.5.sp),
          ),
        ),
        child:
            isLoading
                ? Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                      strokeWidth: AppStrokes.strokeVlg,
                    ),
                  ),
                )
                : Text(
                  text,
                  style:
                      textStyle ??
                      AppTextStyles.poppins16Medium(
                        context,
                      ).copyWith(color: AppColors.white),
                ),
      ),
    );
  }
}
