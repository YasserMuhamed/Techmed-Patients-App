import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/generated/l10n.dart';

class VaccinationDatePicker extends StatelessWidget {
  final DateTime? pickedDate;
  final Function(DateTime) onDatePicked;

  const VaccinationDatePicker({super.key, required this.pickedDate, required this.onDatePicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: pickedDate ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now().add(Duration(days: 365 * 10)),
        );
        if (picked != null) {
          onDatePicked(picked);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(border: Border.all(color: AppColors.secondaryText), borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              pickedDate != null ? DateFormat.yMd().format(pickedDate!) : S.of(context).select_vaccination_date,
              style: AppTextStyles.poppins16Regular(
                context,
              ).copyWith(color: pickedDate != null ? AppColors.primaryText : AppColors.secondaryText),
            ),
            Icon(Icons.calendar_today, color: AppColors.primaryColor, size: 20),
          ],
        ),
      ),
    );
  }
}
