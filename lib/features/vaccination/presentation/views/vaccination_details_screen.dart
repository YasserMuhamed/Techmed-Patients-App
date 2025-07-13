import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/core/di/dependency_injection.dart';
import 'package:techmed/core/helpers/toast_helper.dart';

import 'package:techmed/features/vaccination/data/models/vaccination_details/data.dart';
import 'package:techmed/features/vaccination/presentation/cubit/vaccination_cubit.dart';
import 'package:techmed/features/vaccination/presentation/widgets/vaccination_details_loading.dart';

import 'package:techmed/generated/l10n.dart';

class VaccinationDetailsScreen extends StatefulWidget {
  final int vaccinationId;
  const VaccinationDetailsScreen({super.key, required this.vaccinationId});

  @override
  State<VaccinationDetailsScreen> createState() =>
      _VaccinationDetailsScreenState();
}

class _VaccinationDetailsScreenState extends State<VaccinationDetailsScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch vaccination details when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VaccinationCubit>().getVaccinationDetails(
        widget.vaccinationId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).vaccination_details,
          style: AppTextStyles.poppins18Bold(context),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.xmark),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: BlocBuilder<VaccinationCubit, VaccinationState>(
                    builder: (context, state) {
                      if (state is VaccinationDetailsLoading) {
                        return const VaccinationDetailsLoadingWidget();
                      } else if (state is VaccinationDetailsSuccess) {
                        final vaccination = state.vaccination.data!;
                        return VaccinationInfoSection(vaccination: vaccination);
                      } else if (state is VaccinationDetailsFailure) {
                        return Center(
                          child: Text(
                            state.message,
                            style: AppTextStyles.poppins16Medium(context),
                          ),
                        );
                      }
                      return const VaccinationDetailsLoadingWidget();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.error,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: TextButton.icon(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return BlocProvider(
                  create: (context) => getIt<VaccinationCubit>(),
                  child: AlertDialog(
                    title: Text(
                      S.of(context).confirm_delete,
                      style: AppTextStyles.poppins18Bold(context),
                    ),
                    content: Text(
                      S.of(context).delete_vaccination_confirmation,
                      style: AppTextStyles.poppins16Regular(context),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          S.of(context).cancel,
                          style: AppTextStyles.poppins16Medium(context),
                        ),
                      ),
                      BlocConsumer<VaccinationCubit, VaccinationState>(
                        listener: (context, state) {
                          if (state is VaccinationDeleteSuccess) {
                            ToastHelper.showSuccessToast(
                              context,
                              S.of(context).vaccination_deleted_successfully,
                            );
                            Navigator.of(context).pop(true);
                            Navigator.of(context).pop(true);
                          } else if (state is VaccinationDeleteFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is VaccinationDeleteLoading) {
                            return TextButton(
                              onPressed: () {},
                              child: Center(
                                child: const CircularProgressIndicator(),
                              ),
                            );
                          }
                          return TextButton(
                            onPressed: () {
                              context
                                  .read<VaccinationCubit>()
                                  .deleteVaccination(widget.vaccinationId);
                            },
                            child: Text(
                              S.of(context).delete,
                              style: AppTextStyles.poppins16Medium(context),
                            ),
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
          label: Text(
            S.of(context).delete_vaccination,
            style: AppTextStyles.poppins16Bold(
              context,
            ).copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}

class VaccinationInfoSection extends StatelessWidget {
  const VaccinationInfoSection({super.key, required this.vaccination});

  final Data vaccination;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.verticalSpace,
        Text(
          S.of(context).vaccination_name,
          style: AppTextStyles.poppins18Bold(context),
        ),
        20.verticalSpace,
        Row(
          children: [
            Container(
              width: 48,
              height: 48,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.dividerColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(FontAwesomeIcons.syringe, color: AppColors.white),
            ), // Using medicine icon as placeholder
            16.horizontalSpace,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vaccination.vaccineName ?? 'Unknown Vaccination',
                    style: AppTextStyles.poppins16Medium(context),
                    maxLines: null,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            ),
          ],
        ),
        32.verticalSpace,
        Text(
          S.of(context).vaccination_date,
          style: AppTextStyles.poppins18Bold(context),
        ),
        32.verticalSpace,
        Text(
          vaccination.vaccineDate != null
              ? DateFormat.yMd().format(vaccination.vaccineDate!)
              : 'Not specified',
          style: AppTextStyles.poppins16Regular(context),
        ),
        32.verticalSpace,
        Text(S.of(context).notes, style: AppTextStyles.poppins18Bold(context)),
        32.verticalSpace,
        Text(
          vaccination.vaccineNotes ?? 'No notes available',
          style: AppTextStyles.poppins16Regular(context),
        ),
      ],
    );
  }
}
