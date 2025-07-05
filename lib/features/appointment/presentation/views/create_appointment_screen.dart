import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/core/helpers/extensions.dart';
import 'package:techmed/core/widgets/app_text_field.dart';

import 'package:techmed/features/appointment/presentation/widgets/create_appointment_button.dart';
import 'package:techmed/features/appointment/presentation/widgets/doctors_dropdown_builder.dart';
import 'package:techmed/features/appointment/presentation/widgets/hospitals_dropdown_builder.dart';

import 'package:techmed/features/appointment/presentation/widgets/appointment_time_picker.dart';
import 'package:techmed/features/appointment/presentation/widgets/appointment_date_picker.dart';

import 'package:techmed/generated/l10n.dart';

class CreateAppointmentScreen extends StatefulWidget {
  const CreateAppointmentScreen({super.key});

  @override
  State<CreateAppointmentScreen> createState() => _CreateAppointmentScreenState();
}

class _CreateAppointmentScreenState extends State<CreateAppointmentScreen> {
  TextEditingController statusController = TextEditingController();

  int? selectedDoctorId;
  int? selectedHospitalId;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;



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
                  Text(S.of(context).status, style: AppTextStyles.poppins16Medium(context)),
                  8.verticalSpace,
                  AppTextField(
                    hintText: S.of(context).enter_your_status,
                    controller: statusController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).status_required;
                      }
                      return null;
                    },
                  ),
                  24.verticalSpace,
                  Text(S.of(context).date, style: AppTextStyles.poppins16Medium(context)),
                  8.verticalSpace,
                  AppointmentDatePicker(selectedDate: selectedDate, onDateSelected: (date) => setState(() => selectedDate = date)),
                  24.verticalSpace,
                  Text(S.of(context).time, style: AppTextStyles.poppins16Medium(context)),
                  8.verticalSpace,
                  AppointmentTimePicker(selectedTime: selectedTime, onTimeSelected: (time) => setState(() => selectedTime = time)),

                  24.verticalSpace,
                  Text(S.of(context).doctor_name, style: AppTextStyles.poppins16Medium(context)),
                  8.verticalSpace,
                  DoctorsDropdownBuilder(selectedDoctorId: selectedDoctorId, onChanged: (id) => setState(() => selectedDoctorId = id)),
                  24.verticalSpace,
                  Text(S.of(context).hospital_name, style: AppTextStyles.poppins16Medium(context)),
                  8.verticalSpace,
                  HospitalsDropdownBuilder(
                    selectedHospitalId: selectedHospitalId,
                    onChanged: (id) => setState(() => selectedHospitalId = id),
                  ),
                  42.verticalSpace,
                  CreateAppointmentButton(
                    formKey: formKey,
                    autovalidateMode: autovalidateMode,
                    setAutovalidateMode: (mode) => setState(() => autovalidateMode = mode),
                    statusController: statusController,
                    selectedDate: selectedDate,
                    selectedTime: selectedTime,
                    selectedDoctorId: selectedDoctorId,
                    selectedHospitalId: selectedHospitalId,
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
