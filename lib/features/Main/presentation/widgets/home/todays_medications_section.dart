import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_font_weights.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/generated/l10n.dart';

class TodaysMedicationsSection extends StatelessWidget {
  const TodaysMedicationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).todays_medications, style: AppTextStyles.poppins20SemiBold(context)),
        MedicationItem(medicationName: "Paracetamol", dosage: "500mg - 1 pill", time: "8:00 AM"),
        MedicationItem(medicationName: "Paracetamol", dosage: "500mg - 1 pill", time: "8:00 AM"),
      ],
    );
  }
}

class MedicationItem extends StatelessWidget {
  const MedicationItem({super.key, required this.medicationName, required this.dosage, required this.time});

  final String medicationName;
  final String dosage;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.darkBackground, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_MedicationDetails(medicationName, dosage, time), _MedicationIcon()],
      ),
    );
  }
}

class _MedicationDetails extends StatelessWidget {
  const _MedicationDetails(this.medicationName, this.dosage, this.time);

  final String medicationName;
  final String dosage;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Paracetamol", style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: AppFontWeights.semiBold)),
        Text("500mg - 1 pill", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: AppFontWeights.regular)),
        SizedBox(height: 8.h),
        Row(
          children: [
            Icon(FontAwesomeIcons.clock, size: 18, color: Theme.of(context).colorScheme.primary),
            SizedBox(width: 6),
            Text("8:00 AM", style: AppTextStyles.poppins12Medium(context).copyWith(color: AppColors.secondaryText)),
          ],
        ),
      ],
    );
  }
}

class _MedicationIcon extends StatelessWidget {
  const _MedicationIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: AppColors.primaryColor.withAlpha(120), borderRadius: BorderRadius.circular(300)),
      child: Center(child: Icon(FontAwesomeIcons.pills, color: AppColors.white)),
    );
  }
}
