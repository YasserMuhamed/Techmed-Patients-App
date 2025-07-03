import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:techmed/Core/helpers/shared_pref_helper.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/core/widgets/custom_button.dart';

class SignoutSection extends StatelessWidget {
  const SignoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      textColor: AppColors.grayText,
      contentPadding: EdgeInsets.zero,
      onTap: () {
        showAdaptiveDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Sign out"),
              content: Text("Are you sure you want to sign out"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "no",
                    style: TextStyle(color: AppColors.grayText),
                  ),
                ),
                SizedBox(
                  width: 80.w,
                  child: CustomButton(
                    bgColor: AppColors.grayText,
                    onPressed: () async {
                      SharedPrefHelper.clearAllSecuredData();

                      // GoRouter.of(context).pushReplacement(AppRoutes.kLoginView);
                    },
                    text: "yes",
                  ),
                ),
              ],
            );
          },
        );
      },
      title: Text(
        "Sign out",
        style: Theme.of(
          context,
        ).textTheme.labelLarge!.copyWith(color: AppColors.error),
      ),
      trailing: Icon(Icons.logout, color: AppColors.error),
    );
  }
}
