import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/core/helpers/extensions.dart';
import 'package:techmed/core/helpers/toast_helper.dart';
import 'package:techmed/core/widgets/app_text_field.dart';
import 'package:techmed/core/widgets/custom_button.dart';
import 'package:techmed/features/vaccination/data/models/create_vaccination_request.dart';
import 'package:techmed/features/vaccination/presentation/cubit/vaccination_cubit.dart';
import 'package:techmed/features/vaccination/presentation/widgets/vaccination_date_picker.dart';
import 'package:techmed/generated/l10n.dart';

class CreateVaccinationScreen extends StatefulWidget {
  const CreateVaccinationScreen({super.key});

  @override
  State<CreateVaccinationScreen> createState() => _CreateVaccinationScreenState();
}

class _CreateVaccinationScreenState extends State<CreateVaccinationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  DateTime? pickedVaccinationDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: Text(S.of(context).add_vaccination, style: AppTextStyles.poppins18Medium(context)),
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
                  Text(S.of(context).vaccination_name, style: AppTextStyles.poppins16Medium(context)),
                  8.verticalSpace,
                  AppTextField(
                    hintText: S.of(context).enter_vaccination_name,
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).vaccination_name_required;
                      }
                      return null;
                    },
                  ),
                  24.verticalSpace,
                  Text(S.of(context).vaccination_date, style: AppTextStyles.poppins16Medium(context)),
                  8.verticalSpace,
                  VaccinationDatePicker(
                    pickedDate: pickedVaccinationDate,
                    onDatePicked: (picked) {
                      setState(() {
                        pickedVaccinationDate = picked;
                      });
                    },
                  ),
                  24.verticalSpace,
                  Text(S.of(context).notes, style: AppTextStyles.poppins16Medium(context)),
                  8.verticalSpace,
                  AppTextField(hintText: S.of(context).vaccination_note_hint, maxLines: 5, controller: noteController),
                  24.verticalSpace,
                  BlocConsumer<VaccinationCubit, VaccinationState>(
                    listenWhen: (previous, current) {
                      return current is VaccinationCreateSuccess || current is VaccinationCreateFailure;
                    },
                    listener: (context, state) {
                      if (state is VaccinationCreateSuccess) {
                        ToastHelper.showSuccessToast(context, S.of(context).vaccination_added_successfully);
                        Navigator.of(context).pop(true);
                      } else if (state is VaccinationCreateFailure) {
                        ToastHelper.showErrorToast(context, state.message);
                      }
                    },
                    builder: (context, state) {
                      if (state is VaccinationCreateLoading) {
                        return CustomButton(text: "", isLoading: true, onPressed: () {});
                      }
                      return CustomButton(
                        text: S.of(context).add_vaccination,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (pickedVaccinationDate == null) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Vaccination date is required')));
                              return;
                            } else {
                              CreateVaccinationRequest createVaccinationRequest = CreateVaccinationRequest(
                                vaccineName: nameController.text,
                                vaccineDate: pickedVaccinationDate!,
                                vaccineNotes: noteController.text,
                              );
                              BlocProvider.of<VaccinationCubit>(context).createVaccination(createVaccinationRequest);
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
