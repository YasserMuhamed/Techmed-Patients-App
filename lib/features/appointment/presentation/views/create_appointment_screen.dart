import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/core/helpers/extensions.dart';
import 'package:techmed/core/helpers/toast_helper.dart';
import 'package:techmed/core/widgets/app_text_field.dart';
import 'package:techmed/core/widgets/custom_button.dart';
import 'package:techmed/features/appointment/presentation/manager/appointments/appointments_cubit.dart';
import 'package:techmed/features/medication/presentation/manager/medication/medication_cubit.dart';
import 'package:techmed/generated/l10n.dart';

class CreateAppointmentScreen extends StatefulWidget {
  const CreateAppointmentScreen({super.key});

  @override
  State<CreateAppointmentScreen> createState() => _CreateAppointmentScreenState();
}

class _CreateAppointmentScreenState extends State<CreateAppointmentScreen> {
  TextEditingController appointmentNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
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
        title: Text(S.of(context).add_appointment, style: AppTextStyles.poppins18Medium(context)),
        centerTitle: true,
        leading: IconButton(icon: Icon(FontAwesomeIcons.xmark, color: AppColors.white), onPressed: () => context.pop()),
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
                  Text(S.of(context).medication_name, style: AppTextStyles.poppins16Medium(context)),
                  8.verticalSpace,
                  AppTextField(hintText: S.of(context).enter_medication_name, controller: appointmentNameController),
                  24.verticalSpace,
                  Text(S.of(context).dosage, style: AppTextStyles.poppins16Medium(context)),
                  8.verticalSpace,
                  AppTextField(hintText: S.of(context).dosage_hint, controller: appointmentNameController),
                  24.verticalSpace,
                  Text(S.of(context).start_date, style: AppTextStyles.poppins16Medium(context)),
                  8.verticalSpace,
                  GestureDetector(
                    onTap: () async {
                      pickedStartDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      setState(() {});
                      // Handle pickedDate as needed
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.cardBackground),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            pickedStartDate != null ? DateFormat('yyyy-MM-dd').format(pickedStartDate!) : S.of(context).select_start_date,
                            style: AppTextStyles.poppins14Regular(
                              context,
                            ).copyWith(color: pickedStartDate == null ? AppColors.secondaryText : AppColors.primaryText),
                          ),
                          Icon(Icons.calendar_today, color: AppColors.secondaryText, size: 20),
                        ],
                      ),
                    ),
                  ),
                  24.verticalSpace,
                  Text(S.of(context).end_date, style: AppTextStyles.poppins16Medium(context)),
                  8.verticalSpace,
                  GestureDetector(
                    onTap: () async {
                      pickedEndDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      setState(() {});
                      // Handle pickedDate as needed
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.cardBackground),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            pickedEndDate != null ? DateFormat('yyyy-MM-dd').format(pickedEndDate!) : S.of(context).select_end_date,
                            style: AppTextStyles.poppins14Regular(
                              context,
                            ).copyWith(color: pickedEndDate == null ? AppColors.secondaryText : AppColors.primaryText),
                          ),
                          Icon(Icons.calendar_today, color: AppColors.secondaryText, size: 20),
                        ],
                      ),
                    ),
                  ),

                  24.verticalSpace,
                  Text(S.of(context).medicine, style: AppTextStyles.poppins16Medium(context)),
                  8.verticalSpace,
                  // BlocBuilder<MedicationCubit, MedicationState>(
                  //   builder: (context, state) {
                  //     if (state is MedicinesLoading) {
                  //       return Center(child: CircularProgressIndicator());
                  //     } else if (state is MedicinesFailure) {
                  //       return Text(
                  //         state.message,
                  //         style: AppTextStyles.poppins14Regular(
                  //           context,
                  //         ).copyWith(color: Colors.red),
                  //       );
                  //     } else if (state is MedicinesSuccess) {
                  //       if (state.medicines.data!.medicine!.isNotEmpty) {
                  //         return DropdownButtonFormField<String>(
                  //           items:
                  //               state.medicines.data!.medicine!
                  //                   .map(
                  //                     (medicine) => DropdownMenuItem<String>(
                  //                       value: medicine.id.toString(),
                  //                       child: Text(medicine.enName ?? ''),
                  //                     ),
                  //                   )
                  //                   .toList(),
                  //           onChanged: (value) {
                  //             setState(() {
                  //               selectedMedicineId = int.tryParse(value!);
                  //             });
                  //           },

                  //           decoration: InputDecoration(
                  //             labelText: S.of(context).select_medicine,
                  //             labelStyle: AppTextStyles.poppins14Regular(
                  //               context,
                  //             ).copyWith(color: AppColors.secondaryText),
                  //             enabledBorder: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(8),
                  //               borderSide: BorderSide(
                  //                 color: AppColors.cardBackground,
                  //               ),
                  //             ),
                  //             border: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(8),
                  //               borderSide: BorderSide(
                  //                 color: AppColors.cardBackground,
                  //               ),
                  //             ),
                  //           ),
                  //         );
                  //       }
                  //     }
                  //     return SizedBox.shrink();
                  //   },
                  // ),
                  24.verticalSpace,
                  Text(S.of(context).notes, style: AppTextStyles.poppins16Medium(context)),
                  8.verticalSpace,
                  AppTextField(hintText: S.of(context).note_hint, maxLines: 5, controller: noteController),
                  24.verticalSpace,

                  BlocConsumer<AppointmentsCubit, AppointmentsState>(
                    listenWhen: (previous, current) {
                      return current is AppointmentCreateSuccess || current is AppointmentCreateFailure;
                    },
                    listener: (context, state) {
                      if (state is AppointmentCreateSuccess) {
                        ToastHelper.showSuccessToast(context, S.of(context).appointment_added_successfully);
                        Navigator.of(context).pop(true);
                      } else if (state is AppointmentCreateFailure) {
                        ToastHelper.showErrorToast(context, state.message);
                      }
                    },
                    builder: (context, state) {
                      if (state is MedicationCreateLoading) {
                        return CustomButton(text: "", isLoading: true, onPressed: () {});
                      }
                      return CustomButton(
                        text: S.of(context).add_medication,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (pickedStartDate == null) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(S.of(context).start_date_required)));
                              return;
                            } else if (pickedEndDate == null) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(S.of(context).end_date_required)));
                              return;
                            } else if (selectedMedicineId == null) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(S.of(context).medicine_required)));
                              return;
                            } else {
                              // CreateAppointmentRequest createAppointmentRequest =
                              //     CreateAppointmentRequest(

                              //     );
                              // BlocProvider.of<MedicationCubit>(
                              //   context,
                              // ).createMedication(createMedicationRequest);
                            }
                          } else {
                            setState(() {
                              autovalidateMode = AutovalidateMode.onUserInteraction;
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
