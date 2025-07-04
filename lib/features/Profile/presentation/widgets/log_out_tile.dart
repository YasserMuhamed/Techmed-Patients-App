import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techmed/configs/routing/app_routes.dart';
import 'package:techmed/configs/theme/app_colors.dart' show AppColors;
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/core/helpers/extensions.dart';
import 'package:techmed/core/helpers/shared_pref_helper.dart';
import 'package:techmed/core/widgets/custom_button.dart';
import 'package:techmed/generated/l10n.dart';

class LogoutTile extends StatelessWidget {
  const LogoutTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      contentPadding: EdgeInsets.zero,

      title: Text(
        S.of(context).log_out,
        style: AppTextStyles.poppins16Medium(
          context,
        ).copyWith(color: AppColors.error),
      ),
      trailing: const Icon(
        FontAwesomeIcons.arrowRightFromBracket,
        color: AppColors.error,
        size: 20,
      ),
      onTap: () {
        showAdaptiveDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: AppColors.darkBackground,
              title: Text(
                S.of(context).log_out,
                style: TextStyle(color: AppColors.error),
              ),
              content: Text(
                S.of(context).log_out_confirmation,
                style: TextStyle(color: AppColors.primaryText),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    S.of(context).cancel,
                    style: TextStyle(color: AppColors.grayText),
                  ),
                ),
                SizedBox(
                  width: 80.w,
                  child: CustomButton(
                    bgColor: AppColors.error,
                    onPressed: () async {
                      SharedPrefHelper.clearAllSecuredData();
                      context.pushReplacementNamed(AppRoutes.kLoginScreen);
                    },
                    text: S.of(context).yes,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
