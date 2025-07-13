import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/generated/l10n.dart';

class AppointmentTimePicker extends StatelessWidget {
  final TimeOfDay? selectedTime;
  final ValueChanged<TimeOfDay?> onTimeSelected;

  const AppointmentTimePicker({
    super.key,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (pickedTime != null) {
          onTimeSelected(pickedTime);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                selectedTime == null
                    ? AppColors.cardBackground
                    : AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedTime != null
                  ? selectedTime!.format(context)
                  : S.of(context).select_appointment_time,
              style: AppTextStyles.poppins14Regular(context).copyWith(
                color:
                    selectedTime == null
                        ? AppColors.secondaryText
                        : AppColors.primaryText,
              ),
            ),
            Icon(
              FontAwesomeIcons.clock,
              color: AppColors.secondaryText,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
