import 'package:dartz/dartz.dart';
import 'package:techmed/core/error/failures.dart';
import 'package:techmed/features/auth/data/models/login_request.dart';
import 'package:techmed/features/auth/data/models/login_response/login_response.dart';
import 'package:techmed/features/auth/data/models/register_request.dart';
import 'package:techmed/features/auth/data/models/register_response/register_response.dart';
import 'package:techmed/features/auth/data/models/user_model/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failures, LoginResponse>> login(LoginRequest request);
  Future<Either<Failures, RegisterResponse>> register(
    RegisterRequest registerRequest,
  );
  Future<Either<Failures, UserModel>> getUserProfile();
}
