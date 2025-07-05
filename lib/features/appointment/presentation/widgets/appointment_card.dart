import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart' show AppTextStyles;
import 'package:techmed/core/constants/assets.dart';
import 'package:techmed/core/widgets/svg_ic_container.dart';
import 'package:techmed/generated/l10n.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.doctorName,
    required this.hospitalName,
    this.onTap,
  });

  final String appointmentDate;
  final String appointmentTime;

  final String doctorName;
  final String hospitalName;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Row(
          children: [
            SvgICContainer(svgPath: Assets.assetsSvgsCalenderIc),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('EEE, MMM d · h:mm a').format(
                      DateTime.parse('$appointmentDate $appointmentTime'),
                    ),
                    style: AppTextStyles.poppins16Medium(context),
                  ),
                  Text(
                    S.of(context).doctor_and_hospital(doctorName, hospitalName),
                    style: AppTextStyles.poppins14Regular(
                      context,
                    ).copyWith(color: AppColors.secondaryText),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
