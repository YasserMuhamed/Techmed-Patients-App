import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:techmed/core/helpers/toast_helper.dart';
import 'package:techmed/core/widgets/custom_button.dart';
import 'package:techmed/features/appointment/data/model/create_appointment_request.dart';
import 'package:techmed/features/appointment/presentation/manager/appointments/appointments_cubit.dart';
import 'package:techmed/generated/l10n.dart';

class CreateAppointmentButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  final void Function(AutovalidateMode) setAutovalidateMode;
  final TextEditingController statusController;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final int? selectedDoctorId;
  final int? selectedHospitalId;

  const CreateAppointmentButton({
    super.key,
    required this.formKey,
    required this.autovalidateMode,
    required this.setAutovalidateMode,
    required this.statusController,
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedDoctorId,
    required this.selectedHospitalId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentsCubit, AppointmentsState>(
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
        if (state is AppointmentCreateLoading) {
          return CustomButton(text: "", isLoading: true, onPressed: () {});
        }
        return CustomButton(
          text: S.of(context).add_appointment,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              if (selectedDate == null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(S.of(context).date_required)));
                return;
              } else if (selectedTime == null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(S.of(context).time_required)));
                return;
              } else if (selectedDoctorId == null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(S.of(context).doctor_required)));
                return;
              } else if (selectedHospitalId == null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(S.of(context).hospital_required)));
                return;
              } else {
                CreateAppointmentRequest createAppointmentRequest = CreateAppointmentRequest(
                  status: statusController.text,
                  date: DateFormat('yyyy-MM-dd', "en-US").format(selectedDate!),
                  time: '${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}',
                  doctorId: selectedDoctorId!,
                  hospitalId: selectedHospitalId!,
                );
                debugPrint("Create Appointment Request: ${createAppointmentRequest.toJson()}");
                BlocProvider.of<AppointmentsCubit>(context).createAppointment(createAppointmentRequest);
              }
            } else {
              setAutovalidateMode(AutovalidateMode.onUserInteraction);
            }
          },
        );
      },
    );
  }
}
