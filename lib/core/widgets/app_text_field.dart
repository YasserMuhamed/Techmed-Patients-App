import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.onChange,
    this.suffixIcon,
    this.obscureText,
    this.validator,
    this.keyboardType,
    this.label,
    this.controller,
    this.maxLines,
    this.floatingLabelBehavior,
    this.minLines,
    this.focusNode,
    this.initialValue,
    this.enabled = true,
  });
  final bool? obscureText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final int? maxLines;
  final FocusNode? focusNode;
  final int? minLines;
  final Widget? label;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final String? initialValue;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.poppins16Regular(context),
      initialValue: initialValue,
      enabled: enabled,
      maxLines: maxLines,
      focusNode: focusNode,
      minLines: minLines,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      obscureText: obscureText ?? false,
      onChanged: onChange,
      autofocus: false,

      decoration: InputDecoration(
        fillColor:
            enabled ? AppColors.cardBackground : AppColors.darkBackground,
        filled: true,
        labelStyle: AppTextStyles.poppins16Regular(
          context,
        ).copyWith(color: AppColors.secondaryText),
        hintStyle: AppTextStyles.poppins16Regular(
          context,
        ).copyWith(color: AppColors.secondaryText),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixIconColor: enabled ? AppColors.iconColor : AppColors.disabled,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColors.darkBackground,
            width: 1.5.sp,
          ),
        ),
        suffixIconColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.error)) {
            return Colors
                .red; // Or any other color you want to use for error state
          } else if (states.contains(WidgetState.focused)) {
            return AppColors.primaryText;
          } else {
            return AppColors.iconColor;
          }
        }),
        hintText: hintText,
        alignLabelWithHint: true,
        floatingLabelBehavior:
            floatingLabelBehavior ?? FloatingLabelBehavior.never,
        label: label,
        errorStyle: AppTextStyles.poppins14Regular(
          context,
        ).copyWith(color: AppColors.error),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColors.darkBackground,
            width: 1.5.sp,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColors.darkBackground,
            width: 1.5.sp,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5.sp),
        ),
      ),
    );
  }
}
