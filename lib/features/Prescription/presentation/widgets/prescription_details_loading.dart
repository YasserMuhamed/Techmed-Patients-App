import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/configs/theme/app_colors.dart';

class PrescriptionDetailsLoadingWidget extends StatelessWidget {
  const PrescriptionDetailsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryColor.withOpacity(0.1), AppColors.darkBackground],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primaryColor.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                      child: Icon(Icons.receipt_long, color: AppColors.primaryColor, size: 28),
                    ),
                    16.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Prescription #123', style: AppTextStyles.poppins18Bold(context)),
                          Text('July 15, 2023', style: AppTextStyles.poppins14Regular(context)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          32.verticalSpace,
          Text('Doctor Information', style: AppTextStyles.poppins18Bold(context)),
          16.verticalSpace,
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColors.darkBackground, borderRadius: BorderRadius.circular(12)),
            child: Text('Dr. John Doe - Cardiology', style: AppTextStyles.poppins16Medium(context)),
          ),
          32.verticalSpace,
          Text('Prescribed Medications', style: AppTextStyles.poppins18Bold(context)),
          16.verticalSpace,
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColors.darkBackground, borderRadius: BorderRadius.circular(12)),
            child: Text('Medication Name - Dosage', style: AppTextStyles.poppins16Medium(context)),
          ),
        ],
      ),
    );
  }
}
