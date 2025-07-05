import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:techmed/Core/error/failures.dart';
import 'package:techmed/features/appointment/data/model/all_appointments_response/all_appointments_response.dart';
import 'package:techmed/features/appointment/data/model/appointment_details_response/appointment_details_model.dart';
import 'package:techmed/features/appointment/data/model/create_appointment_request.dart';

import 'package:techmed/features/appointment/data/repository/appointment_repo.dart';
import 'package:techmed/core/api/api_constants.dart';
import 'package:techmed/core/api/api_manager.dart';

class AppointmentRepositoryImplementation extends AppointmentRepository {
  AppointmentRepositoryImplementation({required this.apiManager});
  final ApiManager apiManager;

  @override
  Future<Either<Failures, AllAppointmentsResponse>> getAppointments() async {
    try {
      final response = await apiManager.get(
        endPoint: ApiConstants.getAppointmentsEndPoint,
      );
      return Right(AllAppointmentsResponse.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AppointmentDetailsModel>> getSingleAppointment(
    int appointmentId,
  ) async {
    try {
      final response = await apiManager.get(
        endPoint: ApiConstants.getSingleAppointmentEndPoint(appointmentId),
      );
      return Right(AppointmentDetailsModel.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, dynamic>> cancelAppointment(int appointmentId) async {
    try {
      final response = await apiManager.delete(
        endPoint: ApiConstants.deleteAppointmentEndPoint(appointmentId),
      );
      return Right(response.data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, dynamic>> createAppointment(
    CreateAppointmentRequest appointmentData,
  ) async {
    try {
      final response = await apiManager.post(
        endPoint: ApiConstants.createAppointmentEndPoint,
        data: appointmentData.toJson(),
      );
      return Right(response.data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
