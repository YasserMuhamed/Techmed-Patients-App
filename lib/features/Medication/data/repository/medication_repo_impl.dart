import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:techmed/Core/error/failures.dart';
import 'package:techmed/features/medication/data/model/medication_details_response/medication_details_response.dart';
import 'package:techmed/features/medication/data/model/medications_response/medications_response.dart';
import 'package:techmed/features/medication/data/model/medicines_model/medicines_model.dart';
import 'package:techmed/features/medication/data/model/prescriptions_response/prescriptions_response.dart';
import 'package:techmed/features/medication/data/repository/medication_repo.dart';
import 'package:techmed/core/api/api_constants.dart';
import 'package:techmed/core/api/api_manager.dart';
import 'package:techmed/features/medication/data/model/create_medication_request.dart';

class MedicationRepositoryImplementation extends MedicationRepo {
  MedicationRepositoryImplementation({required this.apiManager});
  final ApiManager apiManager;
  @override
  Future<Either<Failures, MedicationsResponse>> getMedications() async {
    try {
      final response = await apiManager.get(endPoint: ApiConstants.getMedicationsEndPoint);
      return Right(MedicationsResponse.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, PrescriptionsResponse>> getPrescriptions() async {
    try {
      final response = await apiManager.get(endPoint: ApiConstants.getPrescriptionsEndPoint);
      return Right(PrescriptionsResponse.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, dynamic>> createMedication(CreateMedicationRequest medicationData) async {
    try {
      final response = await apiManager.post(endPoint: ApiConstants.createMedicationEndPoint, data: medicationData.toJson());
      return Right(response.data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, dynamic>> deleteMedication(int medicationId) async {
    try {
      final response = await apiManager.delete(endPoint: ApiConstants.deleteMedicationEndPoint(medicationId));
      return Right(response.data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, MedicinesModel>> getAllMedicines() async {
    try {
      final response = await apiManager.get(endPoint: ApiConstants.getAllMedicinesEndPoint);
      return Right(MedicinesModel.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, MedicationDetailsResponse>> getSingleMedication(int medicationId) async {
    try {
      final response = await apiManager.get(endPoint: ApiConstants.getSingleMedicationEndPoint(medicationId));
      return Right(MedicationDetailsResponse.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
