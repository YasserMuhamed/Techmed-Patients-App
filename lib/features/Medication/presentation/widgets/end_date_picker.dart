import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/generated/l10n.dart';

class EndDatePicker extends StatelessWidget {
  final DateTime? pickedEndDate;
  final ValueChanged<DateTime?> onDatePicked;

  const EndDatePicker({
    super.key,
    required this.pickedEndDate,
    required this.onDatePicked,
  });

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
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.cardBackground),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              pickedEndDate != null
                  ? DateFormat('yyyy-MM-dd').format(pickedEndDate!)
                  : S.of(context).select_end_date,
              style: AppTextStyles.poppins14Regular(context).copyWith(
                color:
                    pickedEndDate == null
                        ? AppColors.secondaryText
                        : AppColors.primaryText,
              ),
            ),
            Icon(
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
