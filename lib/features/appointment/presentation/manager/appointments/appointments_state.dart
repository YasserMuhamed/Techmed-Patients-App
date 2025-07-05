part of 'appointments_cubit.dart';

sealed class AppointmentsState extends Equatable {
  const AppointmentsState();

  @override
  List<Object> get props => [];
}

final class AppointmentsInitial extends AppointmentsState {}

final class AppointmentsLoading extends AppointmentsState {}

final class AppointmentsSuccess extends AppointmentsState {
  final AllAppointmentsResponse appointments;

  const AppointmentsSuccess(this.appointments);

  @override
  List<Object> get props => [appointments];
}

final class AppointmentsFailure extends AppointmentsState {
  final String message;

  const AppointmentsFailure(this.message);

  @override
  List<Object> get props => [message];
}

// States for creating an appointment
final class AppointmentCreateLoading extends AppointmentsState {}

final class AppointmentCreateSuccess extends AppointmentsState {}

final class AppointmentCreateFailure extends AppointmentsState {
  final String message;

  const AppointmentCreateFailure(this.message);

  @override
  List<Object> get props => [message];
}

// States for canceling an appointment
final class AppointmentCancelLoading extends AppointmentsState {}

final class AppointmentCancelSuccess extends AppointmentsState {}

final class AppointmentCancelFailure extends AppointmentsState {
  final String message;

  const AppointmentCancelFailure(this.message);

  @override
  List<Object> get props => [message];
}

// States for getting a single appointment
final class AppointmentDetailsLoading extends AppointmentsState {}

final class AppointmentDetailsSuccess extends AppointmentsState {
  final AppointmentDetailsModel appointment;

  const AppointmentDetailsSuccess(this.appointment);

  @override
  List<Object> get props => [appointment];
}

final class AppointmentDetailsFailure extends AppointmentsState {
  final String message;

  const AppointmentDetailsFailure(this.message);

  @override
  List<Object> get props => [message];
}
