import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techmed/Features/Main/presentation/manager/cubit/bottom_nav_cubit_cubit.dart'
    show BottomNavCubit;

class PrescriptionsAndAppointmentsSection extends StatelessWidget {
  const PrescriptionsAndAppointmentsSection({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TopCardItem(
          icon: FontAwesomeIcons.prescriptionBottle,
          title: "Prescriptions",
          subTitle: "View and manage medications",
          onTap: () {
            pageController.animateToPage(
              1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(1);
          },
        ),
        TopCardItem(
          icon: CupertinoIcons.calendar,
          title: "Appointments",
          subTitle: "Schedule doctor visits",
          onTap: () {
            pageController.animateToPage(
              2,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(2);
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
        width: 160.w,

        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onSurface.withAlpha(25),
              blurRadius: 5,
            ),
          ],
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 38, color: Theme.of(context).colorScheme.primary),
            SizedBox(height: 16.h),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
