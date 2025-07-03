import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techmed/configs/theme/app_font_weights.dart';

class TodaysMedicationsSection extends StatelessWidget {
  const TodaysMedicationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today's Medications",
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontWeight: AppFontWeights.semiBold),
        ),
        MedicationItem(
          medicationName: "Paracetamol",
          dosage: "500mg - 1 pill",
          time: "8:00 AM",
        ),
        MedicationItem(
          medicationName: "Paracetamol",
          dosage: "500mg - 1 pill",
          time: "8:00 AM",
        ),
      ],
    );
  }
}

class MedicationItem extends StatelessWidget {
  const MedicationItem({
    super.key,
    required this.medicationName,
    required this.dosage,
    required this.time,
  });

  final String medicationName;
  final String dosage;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(25),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _MedicationDetails(medicationName, dosage, time),
          _MedicationIcon(),
        ],
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
        Text(
          "Paracetamol",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: AppFontWeights.semiBold,
          ),
        ),
        Text(
          "500mg - 1 pill",
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(fontWeight: AppFontWeights.regular),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Icon(
              FontAwesomeIcons.clock,
              size: 18,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(width: 6),
            Text(
              "8:00 AM",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: AppFontWeights.bold,
              ),
            ),
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
      height: 42.h,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withAlpha(50),
        borderRadius: BorderRadius.circular(300),
      ),
      child: Icon(
        FontAwesomeIcons.pills,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
