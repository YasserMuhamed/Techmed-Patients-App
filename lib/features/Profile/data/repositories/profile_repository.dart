import 'package:dartz/dartz.dart';
import 'package:techmed/core/error/failures.dart';
import 'package:techmed/features/Profile/data/models/change_password_request.dart';
import 'package:techmed/features/Profile/data/models/change_password_response/change_password_response.dart';

abstract class ProfileRepository {
  Future<Either<Failures, ChangePasswordResponse>> changeUserPassword(ChangePasswordRequest request);
}
