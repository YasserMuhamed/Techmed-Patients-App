import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/core/helpers/extensions.dart';
import 'package:techmed/core/helpers/toast_helper.dart';
import 'package:techmed/core/widgets/app_text_field.dart';
import 'package:techmed/core/widgets/custom_button.dart';
import 'package:techmed/features/medication/data/model/create_medication_request.dart';
import 'package:techmed/features/medication/presentation/manager/medication/medication_cubit.dart';
import 'package:techmed/features/medication/presentation/widgets/end_date_picker.dart';
import 'package:techmed/features/medication/presentation/widgets/start_date_picker.dart';
import 'package:techmed/features/medication/presentation/widgets/medicine_dropdown.dart';
import 'package:techmed/generated/l10n.dart';

class CreateMedicationScreen extends StatefulWidget {
  const CreateMedicationScreen({super.key});

  @override
  State<CreateMedicationScreen> createState() => _CreateMedicationScreenState();
}

class _CreateMedicationScreenState extends State<CreateMedicationScreen> {
  TextEditingController dosageController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  int? selectedMedicineId;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  DateTime? pickedStartDate;
  DateTime? pickedEndDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: Text(
          S.of(context).add_medication,
          style: AppTextStyles.poppins18Medium(context),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.xmark, color: AppColors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  24.verticalSpace,
                  Text(
                    S.of(context).medicine,
                    style: AppTextStyles.poppins16Medium(context),
                  ),
                  8.verticalSpace,
                  BlocBuilder<MedicationCubit, MedicationState>(
                    builder: (context, state) {
                      if (state is MedicinesLoading) {
                        return Skeletonizer(
                          child: ListTile(
                            title: Text(
                              S.of(context).select_medicine,
                              style: AppTextStyles.poppins14Regular(
                                context,
                              ).copyWith(color: AppColors.secondaryText),
                            ),

                            trailing: const Icon(
                              FontAwesomeIcons.spinner,
                              color: AppColors.secondaryText,
                              size: 16,
                            ),
                          ),
                        );
                      } else if (state is MedicinesFailure) {
                        return Text(
                          state.message,
                          style: AppTextStyles.poppins14Regular(
                            context,
                          ).copyWith(color: Colors.red),
                        );
                      } else if (state is MedicinesSuccess) {
                        return MedicineDropdown(
                          medicines: state.medicines.data!.medicine!,
                          selectedMedicineId: selectedMedicineId,
                          onChanged: (id) {
                            setState(() {
                              selectedMedicineId = id;
                            });
                          },
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                  24.verticalSpace,
                  Text(
                    S.of(context).dosage,
                    style: AppTextStyles.poppins16Medium(context),
                  ),
                  8.verticalSpace,
                  AppTextField(
                    hintText: S.of(context).dosage_hint,
                    controller: dosageController,
                  ),
                  24.verticalSpace,
                  Text(
                    S.of(context).start_date,
                    style: AppTextStyles.poppins16Medium(context),
                  ),
                  8.verticalSpace,
                  StartDatePicker(
                    pickedStartDate: pickedStartDate,
                    onDatePicked: (picked) {
                      setState(() {
                        pickedStartDate = picked;
                      });
                    },
                  ),
                  24.verticalSpace,
                  Text(
                    S.of(context).end_date,
                    style: AppTextStyles.poppins16Medium(context),
                  ),
                  8.verticalSpace,
                  EndDatePicker(
                    pickedEndDate: pickedEndDate,
                    onDatePicked: (picked) {
                      setState(() {
                        pickedEndDate = picked;
                      });
                    },
                  ),

                  24.verticalSpace,
                  Text(
                    S.of(context).notes,
                    style: AppTextStyles.poppins16Medium(context),
                  ),
                  8.verticalSpace,
                  AppTextField(
                    hintText: S.of(context).note_hint,
                    maxLines: 5,
                    controller: noteController,
                  ),
                  24.verticalSpace,

                  BlocConsumer<MedicationCubit, MedicationState>(
                    listenWhen: (previous, current) {
                      return current is MedicationCreateSuccess ||
                          current is MedicationCreateFailure;
                    },
                    listener: (context, state) {
                      if (state is MedicationCreateSuccess) {
                        ToastHelper.showSuccessToast(
                          context,
                          S.of(context).medication_added_successfully,
                        );
                        Navigator.of(context).pop(true);
                      } else if (state is MedicationCreateFailure) {
                        ToastHelper.showErrorToast(context, state.message);
                      }
                    },
                    builder: (context, state) {
                      if (state is MedicationCreateLoading) {
                        return CustomButton(
                          text: "",
                          isLoading: true,
                          onPressed: () {},
                        );
                      }
                      return CustomButton(
                        text: S.of(context).add_medication,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (pickedStartDate == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    S.of(context).start_date_required,
                                  ),
                                ),
                              );
                              return;
                            } else if (pickedEndDate == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    S.of(context).end_date_required,
                                  ),
                                ),
                              );
                              return;
                            } else if (selectedMedicineId == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    S.of(context).medicine_required,
                                  ),
                                ),
                              );
                              return;
                            } else {
                              CreateMedicationRequest createMedicationRequest =
                                  CreateMedicationRequest(
                                    dosage: dosageController.text,
                                    startDate: DateFormat(
                                      'yyyy-MM-dd HH:mm:ss.SSS',
                                      "en_US",
                                    ).format(pickedStartDate!),
                                    endDate: DateFormat(
                                      'yyyy-MM-dd HH:mm:ss.SSS',
                                      "en_US",
                                    ).format(pickedEndDate!),
                                    notes: noteController.text,
                                    medicineId: selectedMedicineId!,
                                  );
                              BlocProvider.of<MedicationCubit>(
                                context,
                              ).createMedication(createMedicationRequest);
                            }
                          } else {
                            setState(() {
                              autovalidateMode =
                                  AutovalidateMode.onUserInteraction;
                            });
                          }
                        },
                      );
                    },
                  ),
                  24.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
