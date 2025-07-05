import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/features/appointment/presentation/widgets/appointment_card.dart';
import 'package:techmed/generated/l10n.dart';

class AppointmentLoadingCards extends StatelessWidget {
  const AppointmentLoadingCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(),
            Text(
              S.of(context).up_coming,
              style: AppTextStyles.poppins18Bold(context),
            ),
            26.verticalSpace,
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 7,
              separatorBuilder: (context, index) => 26.verticalSpace,
              itemBuilder: (context, index) {
                return AppointmentCard(
                  appointmentDate: '2023-10-15',
                  appointmentTime: '14:30:00',
                  doctorName: 'Dr. John Doe',
                  hospitalName: 'TechMed Hospital',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
