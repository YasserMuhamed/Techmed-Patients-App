import 'package:flutter/material.dart';
import 'package:techmed/configs/theme/app_colors.dart';

class ResetPasswordTile extends StatelessWidget {
  const ResetPasswordTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {
        // GoRouter.of(context).push("AppRoutes.kUpdatePasswordPage");
      },
      title: Text(
        "reset-password",
        style: Theme.of(context).textTheme.labelLarge,
      ),
      trailing: Icon(Icons.lock, color: AppColors.grayText),
    );
  }
}
