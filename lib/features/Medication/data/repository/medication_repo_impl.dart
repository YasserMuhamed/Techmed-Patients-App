import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:techmed/Core/error/failures.dart';
import 'package:techmed/Features/Medication/data/model/medications_response/medications_response.dart';
import 'package:techmed/Features/Medication/data/model/prescriptions_response/prescriptions_response.dart';
import 'package:techmed/Features/Medication/data/repository/medication_repo.dart';
import 'package:techmed/core/api/api_manager.dart';

class MedicationRepositoryImplementation extends MedicationRepo {
  MedicationRepositoryImplementation({required this.apiManager});
  final ApiManager apiManager;
  @override
  Future<Either<Failures, MedicationsResponse>> getMedications() async {
    try {
      final response = await apiManager.get(endPoint: "/medications");
      return Right(MedicationsResponse.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(
        ServerFailure(error: 'There was error while getting medications'),
      );
    }
  }

  @override
  Future<Either<Failures, PrescriptionsResponse>> getPrescriptions() async {
    try {
      final response = await apiManager.get(endPoint: "/prescriptions");
      return Right(PrescriptionsResponse.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(
        ServerFailure(error: 'There was error while getting prescriptions'),
      );
    }
  }
}
