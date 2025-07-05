import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/core/di/dependency_injection.dart';
import 'package:techmed/core/helpers/toast_helper.dart';
import 'package:techmed/core/widgets/pill_container.dart';
import 'package:techmed/features/medication/data/model/medication_details_response/data.dart';
import 'package:techmed/features/medication/presentation/manager/medication/medication_cubit.dart';
import 'package:techmed/features/medication/presentation/widgets/medications/medication_details_loading.dart';
import 'package:techmed/generated/l10n.dart';

class MedicationDetailsScreen extends StatefulWidget {
  final int medicationId;

  const MedicationDetailsScreen({super.key, required this.medicationId});

  @override
  State<MedicationDetailsScreen> createState() => _MedicationDetailsScreenState();
}

class _MedicationDetailsScreenState extends State<MedicationDetailsScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch medication details when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MedicationCubit>().getMedicationDetails(widget.medicationId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).medication_details, style: AppTextStyles.poppins18Bold(context)),
        centerTitle: true,
        leading: IconButton(icon: Icon(FontAwesomeIcons.xmark), onPressed: () => Navigator.of(context).pop()),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              BlocBuilder<MedicationCubit, MedicationState>(
                builder: (context, state) {
                  if (state is MedicationDetailsLoading) {
                    return const MedicationDetailsLoadingWidget();
                  } else if (state is MedicationDetailsSuccess) {
                    final medication = state.medication.data!;
                    return MedicationInfoSection(medication: medication);
                  } else if (state is MedicationDetailsFailure) {
                    return Center(child: Text(state.message, style: AppTextStyles.poppins16Medium(context)));
                  }
                  return const MedicationDetailsLoadingWidget();
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: DecoratedBox(
        decoration: BoxDecoration(color: AppColors.error, borderRadius: BorderRadius.circular(8.r)),
        child: TextButton.icon(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return BlocProvider(
                  create: (context) => getIt<MedicationCubit>(),

                  child: AlertDialog(
                    title: Text(S.of(context).confirm_delete, style: AppTextStyles.poppins18Bold(context)),
                    content: Text(S.of(context).delete_medication_confirmation, style: AppTextStyles.poppins16Regular(context)),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(S.of(context).cancel, style: AppTextStyles.poppins16Medium(context)),
                      ),
                      BlocConsumer<MedicationCubit, MedicationState>(
                        listener: (context, state) {
                          if (state is MedicationDeleteSuccess) {
                            ToastHelper.showSuccessToast(context, S.of(context).medication_deleted_successfully);
                            Navigator.of(context).pop(true);
                            Navigator.of(context).pop(true);
                          } else if (state is MedicationDeleteFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
                          }
                        },
                        builder: (context, state) {
                          if (state is MedicationDeleteLoading) {
                            return TextButton(onPressed: () {}, child: Center(child: const CircularProgressIndicator()));
                          }
                          return TextButton(
                            onPressed: () {
                              context.read<MedicationCubit>().deleteMedication(widget.medicationId);
                            },
                            child: Text(S.of(context).delete, style: AppTextStyles.poppins16Medium(context)),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          icon: Icon(FontAwesomeIcons.trash, color: AppColors.white, size: 24),
          label: Text(S.of(context).delete_medication, style: AppTextStyles.poppins16Bold(context).copyWith(color: AppColors.white)),
        ),
      ),
    );
  }
}

class MedicationInfoSection extends StatelessWidget {
  const MedicationInfoSection({super.key, required this.medication});

  final Data medication;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.verticalSpace,
        Text(S.of(context).medication, style: AppTextStyles.poppins18Bold(context)),
        20.verticalSpace,
        Row(
          children: [
            PillContainer(),
            16.horizontalSpace,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    medication.medicine?.enName ?? 'Unknown Medication',
                    style: AppTextStyles.poppins16Medium(context),
                    maxLines: null,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  Text(
                    S.of(context).dosage_variable(medication.dosage ?? ''),
                    style: AppTextStyles.poppins14Regular(context).copyWith(color: AppColors.secondaryText),
                    maxLines: null,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            ),
          ],
        ),
        28.verticalSpace,
        Text(S.of(context).dosage, style: AppTextStyles.poppins18Bold(context)),
        28.verticalSpace,
        Text(medication.dosage ?? '', style: AppTextStyles.poppins16Regular(context)),
        32.verticalSpace,
        Text(S.of(context).start_date, style: AppTextStyles.poppins18Bold(context)),
        32.verticalSpace,
        Text(
          medication.startDate != null ? DateFormat.yMd().format(medication.startDate!) : 'Not specified',
          style: AppTextStyles.poppins16Regular(context),
        ),
        32.verticalSpace,
        Text(S.of(context).end_date, style: AppTextStyles.poppins18Bold(context)),
        32.verticalSpace,
        Text(
          medication.endDate != null ? DateFormat.yMd().format(medication.endDate!) : 'Not specified',
          style: AppTextStyles.poppins16Regular(context),
        ),
        32.verticalSpace,
        Text(S.of(context).notes, style: AppTextStyles.poppins18Bold(context)),
        32.verticalSpace,
        Text(medication.notes ?? S.of(context).no_notes_available, style: AppTextStyles.poppins16Regular(context)),
      ],
    );
  }
}
