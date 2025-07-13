import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:techmed/features/appointment/data/model/all_appointments_response/all_appointments_response.dart';
import 'package:techmed/features/appointment/data/model/appointment_details_response/appointment_details_model.dart';
import 'package:techmed/features/appointment/data/model/create_appointment_request.dart';
import 'package:techmed/features/appointment/data/model/hospitals_model/hospitals_model.dart';
import 'package:techmed/features/appointment/data/repository/appointment_repo.dart';

part 'appointments_state.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  AppointmentsCubit(this.appointmentRepository) : super(AppointmentsInitial());
  final AppointmentRepository appointmentRepository;

  Future<void> getAppointments() async {
    emit(AppointmentsLoading());
    final result = await appointmentRepository.getAppointments();
    result.fold(
      (failure) => emit(AppointmentsFailure(failure.error)),
      (appointments) => emit(AppointmentsSuccess(appointments)),
    );
  }

  Future<void> getAppointmentDetails(int appointmentId) async {
    emit(AppointmentDetailsLoading());
    final result = await appointmentRepository.getSingleAppointment(
      appointmentId,
    );
    result.fold(
      (failure) => emit(AppointmentDetailsFailure(failure.error)),
      (appointment) => emit(AppointmentDetailsSuccess(appointment)),
    );
  }

  Future<void> createAppointment(
    CreateAppointmentRequest appointmentData,
  ) async {
    emit(AppointmentCreateLoading());
    final result = await appointmentRepository.createAppointment(
      appointmentData,
    );
    result.fold(
      (failure) => emit(AppointmentCreateFailure(failure.error)),
      (_) => emit(AppointmentCreateSuccess()),
    );
  }

  Future<void> cancelAppointment(int appointmentId) async {
    emit(AppointmentCancelLoading());
    final result = await appointmentRepository.cancelAppointment(appointmentId);
    result.fold(
      (failure) => emit(AppointmentCancelFailure(failure.error)),
      (_) => emit(AppointmentCancelSuccess()),
    );
  }

  Future<void> getAllHospitals() async {
    emit(HospitalsLoading());
    final result = await appointmentRepository.getHospitals();
    result.fold(
      (failure) => emit(HospitalsFailure(failure.error)),
      (hospitals) => emit(HospitalsSuccess(hospitals)),
    );
  }
}
