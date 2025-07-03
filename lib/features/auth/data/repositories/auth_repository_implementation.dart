import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:techmed/core/api/api_constants.dart';
import 'package:techmed/core/api/api_manager.dart';
import 'package:techmed/core/error/failures.dart';
import 'package:techmed/features/auth/data/models/login_request.dart';
import 'package:techmed/features/auth/data/models/login_response/login_response.dart';
import 'package:techmed/features/auth/data/models/register_request.dart';
import 'package:techmed/features/auth/data/models/register_response/register_response.dart';
import 'package:techmed/features/auth/data/models/user_model/user_model.dart';
import 'package:techmed/features/auth/data/repositories/auth_repository.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final ApiManager apiManager;
  AuthRepositoryImplementation({required this.apiManager});

  @override
  Future<Either<Failures, LoginResponse>> login(LoginRequest request) async {
    try {
      final response = await apiManager.post(endPoint: ApiConstants.loginEndPoint, data: request.toJson());
      return right(LoginResponse.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(error: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, RegisterResponse>> register(RegisterRequest registerRequest) async {
    try {
      final response = await apiManager.post(endPoint: ApiConstants.registerEndPoint, data: registerRequest.toJson());
      return Right(RegisterResponse.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(error: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, UserModel>> getUserProfile() async {
    try {
      final response = await apiManager.get(endPoint: ApiConstants.userProfileEndPoint);
      return Right(UserModel.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(error: e.toString()));
      }
    }
  }
}
