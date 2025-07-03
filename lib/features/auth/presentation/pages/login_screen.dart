import 'package:flutter/material.dart';
import 'package:techmed/generated/l10n.dart';
import 'package:techmed/core/helpers/extensions.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/routing/app_routes.dart';
import 'package:techmed/configs/theme/app_paddings.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techmed/features/auth/presentation/widgets/login_form_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPaddings.gap16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppPaddings.gap88.h.verticalSpace,
                AppPaddings.gap88.h.verticalSpace,
                Text(
                  S.of(context).welcome_message,
                  style: AppTextStyles.poppins20SemiBold(context),
                ),
                const SizedBox(height: 20),
                LoginFormSection(),
                AppPaddings.gap12.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).dont_have_an_account,
                      style: AppTextStyles.poppins14Regular(context),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        overlayColor: AppColors.primaryColor.withOpacity(0),
                        splashFactory: NoSplash.splashFactory,
                        foregroundColor: AppColors.primaryColor,
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        context.pushNamed(AppRoutes.kRegisterScreen);
                      },
                      child: Text(
                        S.of(context).register,
                        style: AppTextStyles.poppins14SemiBold(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
