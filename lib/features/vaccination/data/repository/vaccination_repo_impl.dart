import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:techmed/Core/error/failures.dart';
import 'package:techmed/features/vaccination/data/models/vaccination_model/vaccination_model.dart';
import 'package:techmed/features/vaccination/data/models/vaccination_details/vaccination_details.dart';
import 'package:techmed/features/vaccination/data/repository/vaccination_repo.dart';
import 'package:techmed/core/api/api_constants.dart';
import 'package:techmed/core/api/api_manager.dart';
import 'package:techmed/features/vaccination/data/models/create_vaccination_request.dart';

class VaccinationRepositoryImplementation extends VaccinationRepo {
  VaccinationRepositoryImplementation({required this.apiManager});
  final ApiManager apiManager;

  @override
  Future<Either<Failures, VaccinationModel>> getVaccinations() async {
    try {
      final response = await apiManager.get(
        endPoint: ApiConstants.getVaccinationEndPoint,
      );
      return Right(VaccinationModel.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, dynamic>> createVaccination(
    CreateVaccinationRequest vaccinationData,
  ) async {
    try {
      final response = await apiManager.post(
        endPoint: ApiConstants.createVaccinationEndPoint,
        data: vaccinationData.toJson(),
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
  Future<Either<Failures, dynamic>> deleteVaccination(int vaccinationId) async {
    try {
      final response = await apiManager.delete(
        endPoint: ApiConstants.deleteVaccinationEndPoint(vaccinationId),
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
  Future<Either<Failures, VaccinationDetails>> getSingleVaccination(
    int vaccinationId,
  ) async {
    try {
      final response = await apiManager.get(
        endPoint: ApiConstants.getSingleVaccinationEndPoint(vaccinationId),
      );
      return Right(VaccinationDetails.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
