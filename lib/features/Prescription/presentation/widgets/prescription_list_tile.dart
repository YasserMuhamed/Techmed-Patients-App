import 'package:flutter/material.dart';
import 'package:techmed/configs/routing/app_routes.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/core/helpers/extensions.dart';
import 'package:techmed/features/Prescription/presentation/cubit/prescription_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:techmed/generated/l10n.dart';

class PrescriptionListTile extends StatelessWidget {
  final dynamic prescription;
  const PrescriptionListTile({super.key, required this.prescription});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRoutes.kPrescriptionDetailsScreen, arguments: prescription.id).then((value) {
          if (value == true) {
            BlocProvider.of<PrescriptionCubit>(context).getPrescriptions();
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryColor.withOpacity(0.1), AppColors.darkBackground],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primaryColor.withOpacity(0.3)),
          boxShadow: [BoxShadow(color: AppColors.primaryColor.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 4))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                  child: Icon(Icons.receipt_long, color: AppColors.primaryColor, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).prescription_id(prescription.id.toString()), style: AppTextStyles.poppins16Medium(context)),
                      const SizedBox(height: 4),
                      Text(
                        'Dr. ${prescription.doctor?.name ?? S.of(context).unknown_doctor}',
                        style: AppTextStyles.poppins14Regular(context).copyWith(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    S.of(context).items_count(prescription.items?.length ?? 0),
                    style: AppTextStyles.poppins12Regular(context).copyWith(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.local_hospital, size: 16, color: AppColors.secondaryText),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    prescription.hospital?.name ?? S.of(context).unknown_hospital,
                    style: AppTextStyles.poppins14Regular(context).copyWith(color: AppColors.secondaryText),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: AppColors.secondaryText),
                const SizedBox(width: 8),
                Text(
                  prescription.createdAt != null ? DateFormat.yMd().format(prescription.createdAt!) : S.of(context).no_date,
                  style: AppTextStyles.poppins14Regular(context).copyWith(color: AppColors.secondaryText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
