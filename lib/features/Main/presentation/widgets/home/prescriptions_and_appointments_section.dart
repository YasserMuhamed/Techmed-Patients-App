import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techmed/Features/Main/presentation/manager/cubit/bottom_nav_cubit_cubit.dart' show BottomNavCubit;
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/generated/l10n.dart';

class PrescriptionsAndAppointmentsSection extends StatelessWidget {
  const PrescriptionsAndAppointmentsSection({super.key, required this.pageController});
  final PageController pageController;

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
            pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
            BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(1);
          },
        ),
        TopCardItem(
          icon: CupertinoIcons.calendar,
          title: S.of(context).appointments,
          subTitle: S.of(context).schedule_doctor_visit,
          onTap: () {
            pageController.animateToPage(2, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
            BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(2);
          },
        ),
      ],
    );
  }
}

class TopCardItem extends StatelessWidget {
  const TopCardItem({super.key, required this.icon, required this.title, required this.subTitle, required this.onTap});
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

        decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 38, color: AppColors.white),
            SizedBox(height: 16.h),
            Text(title, style: AppTextStyles.poppins14Medium(context)),
            Text(subTitle, style: AppTextStyles.poppins12Regular(context).copyWith(color: AppColors.secondaryText)),
          ],
        ),
      ),
    );
  }
}
