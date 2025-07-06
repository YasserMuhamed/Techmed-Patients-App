import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:techmed/configs/routing/app_routes.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/core/helpers/extensions.dart';

import 'package:techmed/features/medication/presentation/manager/medication/medication_cubit.dart';
import 'package:techmed/features/medication/presentation/widgets/medication_list_tile.dart';
import 'package:techmed/features/medication/presentation/widgets/medication_failure_refresh.dart';

import 'package:techmed/generated/l10n.dart';

class MedicationScreen extends StatelessWidget {
  const MedicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).medications, style: AppTextStyles.poppins22Bold(context)),
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
                      if (state.medications.data == null || state.medications.data!.isEmpty) {
                        return Center(child: Text(S.of(context).no_medications_found, style: AppTextStyles.poppins16Medium(context)));
                      }

                      return RefreshIndicator(
                        onRefresh: () => BlocProvider.of<MedicationCubit>(context).getMedications(),
                        child: ListView.builder(
                          itemCount: state.medications.data!.length,
                          itemBuilder: (context, index) {
                            final medication = state.medications.data![index];
                            return MedicationListTile(medication: medication);
                          },
                        ),
                      );
                    } else if (state is MedicationFailure) {
                      return MedicationFailureRefresh(message: state.message);
                    }

                    return Center(child: Text("unknown state", style: AppTextStyles.poppins16Medium(context)));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: DecoratedBox(
        decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(8.r)),
        child: TextButton.icon(
          onPressed: () {
            context.pushNamed(AppRoutes.kCreateMedicationScreen).then((value) {
              if (value == true) {
                BlocProvider.of<MedicationCubit>(context).getMedications();
              }
            });
          },
          icon: Icon(Icons.add, color: AppColors.white, size: 24.sp),
          label: Text(S.of(context).add_medication, style: AppTextStyles.poppins16Bold(context).copyWith(color: AppColors.white)),
        ),
      ),
    );
  }
}
