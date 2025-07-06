import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/features/medication/presentation/manager/medication/medication_cubit.dart';
import 'package:techmed/features/medication/presentation/widgets/medication_failure_refresh.dart';
import 'package:techmed/generated/l10n.dart';

class TodaysMedicationsSection extends StatelessWidget {
  const TodaysMedicationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        28.verticalSpace,
        Text(S.of(context).todays_medications, style: AppTextStyles.poppins20SemiBold(context)),
        16.verticalSpace,
        Expanded(
          child: BlocBuilder<MedicationCubit, MedicationState>(
            buildWhen: (previous, current) {
              return current is MedicationLoading || current is MedicationSuccess || current is MedicationFailure;
            },
            builder: (context, state) {
              if (state is MedicationLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MedicationSuccess) {
                final todaysMedicationList =
                    state.medications.data!.where((medication) {
                      final startDate = medication.startDate!;
                      final endDate = medication.endDate!;
                      final today = DateTime.now();
                      return today.isAfter(startDate.subtract(const Duration(days: 1))) &&
                          today.isBefore(endDate.add(const Duration(days: 1)));
                    }).toList();
                if (state.medications.data == null || state.medications.data!.isEmpty) {
                  return Center(child: Text(S.of(context).no_medications_found, style: AppTextStyles.poppins16Medium(context)));
                } else if (todaysMedicationList.isEmpty) {
                  return Center(child: Text(S.of(context).no_medications_found, style: AppTextStyles.poppins16Medium(context)));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: todaysMedicationList.length,
                  itemBuilder: (context, index) {
                    final medication = state.medications.data![index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: MedicationItem(
                        medicationName: medication.medicine!.enName!,
                        dosage: S.of(context).dosage_variable(medication.dosage!),
                        notes: medication.notes ?? "Not specified",
                      ),
                    );
                  },
                );
              } else if (state is MedicationFailure) {
                return MedicationFailureRefresh(message: state.message);
              }

              return Center(child: Text("unknown state", style: AppTextStyles.poppins16Medium(context)));
            },
          ),
        ),
      ],
    );
  }
}

class MedicationItem extends StatelessWidget {
  const MedicationItem({super.key, required this.medicationName, required this.dosage, required this.notes});

  final String medicationName;
  final String dosage;
  final String notes;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.darkBackground, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_MedicationDetails(medicationName, dosage, notes), _MedicationIcon()],
      ),
    );
  }
}

class _MedicationDetails extends StatelessWidget {
  const _MedicationDetails(this.medicationName, this.dosage, this.notes);

  final String medicationName;
  final String dosage;
  final String notes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(medicationName, style: AppTextStyles.poppins16Medium(context)),
        Text(dosage, style: AppTextStyles.poppins14Regular(context)),
        SizedBox(height: 8.h),
        Row(
          children: [
            Icon(FontAwesomeIcons.noteSticky, size: 18, color: Theme.of(context).colorScheme.primary),
            SizedBox(width: 6),
            Text(notes, style: AppTextStyles.poppins12Medium(context).copyWith(color: AppColors.secondaryText)),
          ],
        ),
      ],
    );
  }
}

class _MedicationIcon extends StatelessWidget {
  const _MedicationIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, AppColors.primaryColor.withOpacity(0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [BoxShadow(color: AppColors.primaryColor.withOpacity(0.25), blurRadius: 8, offset: Offset(0, 4))],
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(child: Icon(FontAwesomeIcons.pills, color: AppColors.white, size: 22)),
    );
  }
}
