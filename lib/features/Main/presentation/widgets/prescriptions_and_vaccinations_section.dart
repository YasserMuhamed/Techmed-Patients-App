import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techmed/configs/routing/app_routes.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/core/helpers/extensions.dart';
import 'package:techmed/generated/l10n.dart';

class PrescriptionsAndVaccinationsSection extends StatelessWidget {
  const PrescriptionsAndVaccinationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopCardItem(
          icon: FontAwesomeIcons.prescriptionBottle,
          title: S.of(context).prescriptions,
          subTitle: S.of(context).view_and_manage_medications,
          onTap: () {
            context.pushNamed(AppRoutes.kPrescriptionsScreen);
          },
        ),
        TopCardItem(
          icon: FontAwesomeIcons.syringe,
          title: S.of(context).vaccinations,
          subTitle: S.of(context).view_and_manage_vaccinations,
          onTap: () {
            context.pushNamed(AppRoutes.kVaccinationsScreen);
          },
        ),
      ],
    );
  }
}

class TopCardItem extends StatelessWidget {
  const TopCardItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,

        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 38, color: AppColors.white),
            SizedBox(height: 16.h),
            Text(title, style: AppTextStyles.poppins14Medium(context)),
            Text(
              subTitle,
              style: AppTextStyles.poppins12Regular(
                context,
              ).copyWith(color: AppColors.secondaryText),
            ),
          ],
        ),
      ),
    );
  }
}
