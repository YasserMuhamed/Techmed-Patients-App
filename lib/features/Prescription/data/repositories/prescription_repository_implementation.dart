import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:techmed/Core/error/failures.dart';
import 'package:techmed/core/api/api_constants.dart';
import 'package:techmed/core/api/api_manager.dart';
import 'package:techmed/features/Prescription/data/models/prescription_details/prescription_details.dart';
import 'package:techmed/features/Prescription/data/models/prescriptions_model/prescriptions_model.dart';
import 'package:techmed/features/Prescription/data/repositories/prescription_repository.dart';

class PrescriptionRepositoryImplementation implements PrescriptionRepository {
  PrescriptionRepositoryImplementation({required this.apiManager});
  final ApiManager apiManager;
  @override
  Future<Either<Failures, PrescriptionsModel>> getPrescriptions() async {
    try {
      final response = await apiManager.get(endPoint: ApiConstants.getAllPrescriptionsEndPoint);
      return Right(PrescriptionsModel.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, PrescriptionDetails>> getSinglePrescription(int id) async {
    try {
      final response = await apiManager.get(endPoint: ApiConstants.getSinglePrescriptionEndPoint(id));
      return Right(PrescriptionDetails.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
