import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/features/appointment/presentation/widgets/appointment_card.dart';

class AppointmentInfoSectionSkeleton extends StatelessWidget {
  const AppointmentInfoSectionSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.verticalSpace,
            Text(
              'Appointment Details',
              style: AppTextStyles.poppins18Bold(context),
            ),
            20.verticalSpace,
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
            32.verticalSpace,
            Text('Doctor Name', style: AppTextStyles.poppins18Bold(context)),
            18.verticalSpace,
            Text(
              'Dr. John Doe',
              style: AppTextStyles.poppins16Regular(context),
            ),
            18.verticalSpace,
            Text('Hospital Name', style: AppTextStyles.poppins18Bold(context)),
            18.verticalSpace,
            Text(
              'General Hospital',
              style: AppTextStyles.poppins16Regular(context),
            ),
            18.verticalSpace,
            Text('Date', style: AppTextStyles.poppins18Bold(context)),
            18.verticalSpace,
            Text('01/01/2024', style: AppTextStyles.poppins16Regular(context)),
            18.verticalSpace,
            Text('Time', style: AppTextStyles.poppins18Bold(context)),
            18.verticalSpace,
            Text('10:00 AM', style: AppTextStyles.poppins16Regular(context)),
            18.verticalSpace,
            Text('Status', style: AppTextStyles.poppins18Bold(context)),
            18.verticalSpace,
            Text('Pending', style: AppTextStyles.poppins16Regular(context)),
            18.verticalSpace,
          ],
        ),
      ),
    );
  }
}
