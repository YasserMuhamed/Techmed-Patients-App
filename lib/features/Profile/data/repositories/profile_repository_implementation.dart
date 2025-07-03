import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:techmed/core/api/api_constants.dart';
import 'package:techmed/core/api/api_manager.dart';
import 'package:techmed/core/error/failures.dart';
import 'package:techmed/features/Profile/data/models/change_password_request.dart';
import 'package:techmed/features/Profile/data/models/change_password_response/change_password_response.dart';
import 'package:techmed/features/Profile/data/repositories/profile_repository.dart';

class ProfileRepositoryImplementation implements ProfileRepository {
  ProfileRepositoryImplementation({required this.apiManager});
  final ApiManager apiManager;

  @override
  Future<Either<Failures, ChangePasswordResponse>> changeUserPassword(ChangePasswordRequest request) async {
    try {
      final response = await apiManager.post(endPoint: ApiConstants.changePasswordEndPoint, data: request.toJson());
      return Right(ChangePasswordResponse.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(error: e.toString()));
      }
    }
  }
}
