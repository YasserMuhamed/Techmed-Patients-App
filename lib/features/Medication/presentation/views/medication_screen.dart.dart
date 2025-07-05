import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techmed/configs/routing/app_routes.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/core/helpers/extensions.dart';
import 'package:techmed/core/widgets/pill_container.dart';
import 'package:techmed/features/medication/presentation/manager/medication/medication_cubit.dart';
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
              Text(
                S.of(context).medications,
                style: AppTextStyles.poppins22Bold(context),
              ),
              16.verticalSpace,
              Expanded(
                child: BlocBuilder<MedicationCubit, MedicationState>(
                  buildWhen: (previous, current) {
                    return current is MedicationLoading ||
                        current is MedicationSuccess ||
                        current is MedicationFailure;
                  },
                  builder: (context, state) {
                    if (state is MedicationLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is MedicationSuccess) {
                      if (state.medications.data == null ||
                          state.medications.data!.isEmpty) {
                        return Center(
                          child: Text(
                            S.of(context).no_medications_found,
                            style: AppTextStyles.poppins16Medium(context),
                          ),
                        );
                      }

                      return RefreshIndicator(
                        onRefresh:
                            () =>
                                BlocProvider.of<MedicationCubit>(
                                  context,
                                ).getMedications(),
                        child: ListView.builder(
                          itemCount: state.medications.data!.length,
                          itemBuilder: (context, index) {
                            final medication = state.medications.data![index];
                            return GestureDetector(
                              onTap: () {
                                print("Medication ID: ${medication.id}");
                                context
                                    .pushNamed(
                                      AppRoutes.kMedicationDetailsScreen,
                                      arguments: medication.id,
                                    )
                                    .then((value) {
                                      if (value == true) {
                                        BlocProvider.of<MedicationCubit>(
                                          context,
                                        ).getMedications();
                                      }
                                    });
                              },
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: PillContainer(),
                                title: Text(
                                  medication.medicine!.enName!,
                                  style: AppTextStyles.poppins16Medium(context),
                                ),
                                subtitle: Text(
                                  S
                                      .of(context)
                                      .dosage_variable(medication.dosage!),
                                  style: AppTextStyles.poppins14Regular(
                                    context,
                                  ).copyWith(color: AppColors.secondaryText),
                                ),
                                trailing: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Text(
                                    textAlign: TextAlign.end,
                                    medication.notes!,
                                    style: AppTextStyles.poppins14Regular(
                                      context,
                                    ).copyWith(color: AppColors.primaryText),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else if (state is MedicationFailure) {
                      return RefreshIndicator(
                        onRefresh:
                            () =>
                                BlocProvider.of<MedicationCubit>(
                                  context,
                                ).getMedications(),
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  state.message,
                                  style: AppTextStyles.poppins16Medium(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    return Center(
                      child: Text(
                        "unknown state",
                        style: AppTextStyles.poppins16Medium(context),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: TextButton.icon(
          onPressed: () {
            context.pushNamed(AppRoutes.kCreateMedicationScreen).then((value) {
              if (value == true) {
                BlocProvider.of<MedicationCubit>(context).getMedications();
              }
            });
          },
          icon: Icon(Icons.add, color: AppColors.white, size: 24.sp),
          label: Text(
            S.of(context).add_medication,
            style: AppTextStyles.poppins16Bold(
              context,
            ).copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
