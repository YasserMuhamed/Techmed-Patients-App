import 'package:flutter/material.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/generated/l10n.dart';
import 'package:toastification/toastification.dart';

class ToastHelper {
  static void showErrorToast(BuildContext context, String error) {
    Toastification().show(
      progressBarTheme: const ProgressIndicatorThemeData(
        color: AppColors.error,
      ),
      type: ToastificationType.error,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 5),
      context: context,
      title: Text(
        S.of(context).error,
        style: const TextStyle(color: AppColors.primaryText),
      ),
      description: Text(
        error,
        style: const TextStyle(color: AppColors.primaryText),
      ),
      alignment: Alignment.topCenter,
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      icon: const Icon(Icons.error, color: AppColors.error),
      showIcon: true,
      primaryColor: AppColors.error,
      backgroundColor: AppColors.cardBackground,
      foregroundColor: AppColors.primaryText,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        ),
      ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
      callbacks: ToastificationCallbacks(
        // ignore: avoid_debugPrint
        onTap: (toastItem) => debugPrint('Toast toastItem.id} tapped'),
        onCloseButtonTap:
            (toastItem) =>
                debugPrint('Toast toastItem.id} close button tapped'),
        onAutoCompleteCompleted:
            (toastItem) =>
                debugPrint('Toast toastItem.id} auto complete completed'),
        onDismissed:
            (toastItem) => debugPrint('Toast toastItem.id} dismissed'),
      ),
    );
  }

  static void showSuccessToast(BuildContext context, String message) {
    Toastification().show(
      progressBarTheme: const ProgressIndicatorThemeData(
        color: AppColors.success,
      ),
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 5),
      context: context,
      title: Text(
        S.of(context).success,
        style: const TextStyle(color: AppColors.primaryText),
      ),
      description: Text(
        message,
        style: const TextStyle(color: AppColors.primaryText),
      ),
      alignment: Alignment.topCenter,
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      icon: const Icon(Icons.check, color: AppColors.success),
      showIcon: true,
      primaryColor: AppColors.success,
      backgroundColor: AppColors.cardBackground,
      foregroundColor: AppColors.primaryText,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        ),
      ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => debugPrint('Toast ${toastItem.id} tapped'),
        onCloseButtonTap:
            (toastItem) =>
                debugPrint('Toast ${toastItem.id} close button tapped'),
        onAutoCompleteCompleted:
            (toastItem) =>
                debugPrint('Toast ${toastItem.id} auto complete completed'),
        onDismissed:
            (toastItem) => debugPrint('Toast ${toastItem.id} dismissed'),
      ),
    );
  }
}
