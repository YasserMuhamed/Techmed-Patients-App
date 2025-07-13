import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/generated/l10n.dart';

class AppointmentDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final ValueChanged<DateTime?> onDateSelected;

  const AppointmentDatePicker({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) {
          onDateSelected(pickedDate);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                selectedDate == null
                    ? AppColors.cardBackground
                    : AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate != null
                  ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                  : S.of(context).select_appointment_date,
              style: AppTextStyles.poppins14Regular(context).copyWith(
                color:
                    selectedDate == null
                        ? AppColors.secondaryText
                        : AppColors.primaryText,
              ),
            ),
            const Icon(
              Icons.calendar_today,
              color: AppColors.secondaryText,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
