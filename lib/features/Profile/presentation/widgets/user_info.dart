import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:techmed/features/Profile/presentation/widgets/profile_image.dart';
import 'package:techmed/generated/l10n.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techmed/features/auth/data/models/user_model/user_data.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.user});
  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: const ProfileImage()),
        16.verticalSpace,
        Center(child: Text(user.name!, style: AppTextStyles.poppins22Bold(context))),
        Center(child: Text(user.email!, style: AppTextStyles.poppins16Regular(context).copyWith(color: AppColors.secondaryText))),
        32.verticalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).personal_info, style: AppTextStyles.poppins18Bold(context)),
            22.verticalSpace,
            Text(S.of(context).phone_number, style: AppTextStyles.poppins16Medium(context)),
            Text(user.phoneNumber!, style: AppTextStyles.poppins14Regular(context).copyWith(color: AppColors.secondaryText)),
            22.verticalSpace,
            Text(S.of(context).national_id, style: AppTextStyles.poppins16Medium(context)),
            Text(user.nationalId!, style: AppTextStyles.poppins14Regular(context).copyWith(color: AppColors.secondaryText)),
            22.verticalSpace,
            Text(S.of(context).emergency_contact, style: AppTextStyles.poppins16Medium(context)),
            Text(
              user.emergencyContactName ?? S.of(context).no_name_provided,
              style: AppTextStyles.poppins14Regular(context).copyWith(color: AppColors.secondaryText),
            ),
            Text(
              user.emergencyContactPhone ?? S.of(context).no_emergency_number_provided,
              style: AppTextStyles.poppins14Regular(context).copyWith(color: AppColors.secondaryText),
            ),
            22.verticalSpace,
            Text(S.of(context).allergies, style: AppTextStyles.poppins16Medium(context)),
            Text(
              user.allergies ?? S.of(context).no_allergies_provided,
              style: AppTextStyles.poppins14Regular(context).copyWith(color: AppColors.secondaryText),
            ),
            22.verticalSpace,
            Text(S.of(context).age, style: AppTextStyles.poppins16Medium(context)),
            Text(
              user.age != null ? user.age.toString() : S.of(context).no_age_provided,
              style: AppTextStyles.poppins14Regular(context).copyWith(color: AppColors.secondaryText),
            ),
            22.verticalSpace,
            Text(S.of(context).birth_date, style: AppTextStyles.poppins16Medium(context)),
            Text(
              user.birthDate != null ? DateFormat('dd/MM/yyyy').format(user.birthDate!) : S.of(context).no_birth_date_provided,
              style: AppTextStyles.poppins14Regular(context).copyWith(color: AppColors.secondaryText),
            ),
            22.verticalSpace,
            Text(S.of(context).birth_date, style: AppTextStyles.poppins16Medium(context)),
            Text(
              user.maritalStatus ?? S.of(context).no_allergies_provided,
              style: AppTextStyles.poppins14Regular(context).copyWith(color: AppColors.secondaryText),
            ),
            29.verticalSpace,
          ],
        ),
      ],
    );
  }
}
