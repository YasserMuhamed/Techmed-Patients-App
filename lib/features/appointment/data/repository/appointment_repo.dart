import 'package:dartz/dartz.dart';
import 'package:techmed/Core/error/failures.dart';
import 'package:techmed/features/appointment/data/model/all_appointments_response/all_appointments_response.dart';
import 'package:techmed/features/appointment/data/model/appointment_details_response/appointment_details_model.dart';
import 'package:techmed/features/appointment/data/model/create_appointment_request.dart';
import 'package:techmed/features/appointment/data/model/doctors_model/doctors_model.dart';
import 'package:techmed/features/appointment/data/model/hospitals_model/hospitals_model.dart';

abstract class AppointmentRepository {
  Future<Either<Failures, AllAppointmentsResponse>> getAppointments();
  Future<Either<Failures, AppointmentDetailsModel>> getSingleAppointment(int appointmentId);
  Future<Either<Failures, dynamic>> cancelAppointment(int appointmentId);
  Future<Either<Failures, dynamic>> createAppointment(CreateAppointmentRequest appointmentData);
  Future<Either<Failures, DoctorsModel>> getDoctors();
  Future<Either<Failures, HospitalsModel>> getHospitals();
}
