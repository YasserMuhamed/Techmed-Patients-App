import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/generated/l10n.dart';

class StartDatePicker extends StatelessWidget {
  final DateTime? pickedStartDate;
  final ValueChanged<DateTime?> onDatePicked;

  const StartDatePicker({super.key, required this.pickedStartDate, required this.onDatePicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );
        onDatePicked(picked);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(border: Border.all(color: AppColors.cardBackground), borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              pickedStartDate != null ? DateFormat('yyyy-MM-dd').format(pickedStartDate!) : S.of(context).select_start_date,
              style: AppTextStyles.poppins14Regular(
                context,
              ).copyWith(color: pickedStartDate == null ? AppColors.secondaryText : AppColors.primaryText),
            ),
            Icon(Icons.calendar_today, color: AppColors.secondaryText, size: 20),
          ],
        ),
      ),
    );
  }
}
