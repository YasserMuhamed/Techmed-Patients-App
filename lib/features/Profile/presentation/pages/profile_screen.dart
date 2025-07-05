import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techmed/configs/routing/app_routes.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/core/helpers/extensions.dart';
import 'package:techmed/core/widgets/custom_divider.dart';
import 'package:techmed/features/profile/presentation/profile_cubit/profile_cubit.dart';
import 'package:techmed/features/profile/presentation/widgets/log_out_tile.dart';
import 'package:techmed/features/profile/presentation/widgets/profile_loading_widget.dart';
import 'package:techmed/features/profile/presentation/widgets/user_info.dart';
import 'package:techmed/features/translation/cubit/localization_cubit.dart';
import 'package:techmed/generated/l10n.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        child: RefreshIndicator.adaptive(
          color: AppColors.white,
          onRefresh: () async {
            BlocProvider.of<ProfileCubit>(context).getUserProfile();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return const ProfileLoadingWidget();
                    } else if (state is ProfileSuccess) {
                      return UserInfo(user: state.user.data!);
                    } else if (state is ProfileFailure) {
                      return Center(child: Text(state.error));
                    }
                    return const SizedBox.shrink();
                  },
                ),
                22.verticalSpace,
                Text(
                  S.of(context).account,
                  style: AppTextStyles.poppins18Bold(context),
                ),
                22.verticalSpace,
                CustomDivider(),
                SizedBox(height: 27.h),
                22.verticalSpace,
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  contentPadding: EdgeInsets.zero,

                  title: Text(
                    S.of(context).update_info,
                    style: AppTextStyles.poppins16Medium(context),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.iconColor,
                    size: 20,
                  ),
                  onTap: () {
                    context.pushNamed(AppRoutes.kUpdateUserInfoScreen).then((
                      value,
                    ) {
                      if (value == true) {
                        BlocProvider.of<ProfileCubit>(context).getUserProfile();
                      }
                    });
                  },
                ),
                22.verticalSpace,
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  contentPadding: EdgeInsets.zero,

                  title: Text(
                    S.of(context).change_password,
                    style: AppTextStyles.poppins16Medium(context),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.iconColor,
                    size: 20,
                  ),
                  onTap: () {
                    context.pushNamed(AppRoutes.kChangePasswordScreen);
                  },
                ),
                22.verticalSpace,
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    S.of(context).change_language,
                    style: AppTextStyles.poppins16Medium(context),
                  ),
                  trailing: const Icon(
                    Icons.language,
                    color: AppColors.iconColor,
                    size: 20,
                  ),
                  onTap: () async {
                    final locale = Localizations.localeOf(context);
                    final newLocale =
                        locale.languageCode == 'en'
                            ? const Locale('ar')
                            : const Locale('en');
                    BlocProvider.of<LocaleCubit>(context).setLocale(newLocale);
                  },
                ),
                22.verticalSpace,
                LogoutTile(),
                22.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
