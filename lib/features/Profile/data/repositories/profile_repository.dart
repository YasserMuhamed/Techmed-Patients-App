import 'package:dartz/dartz.dart';
import 'package:techmed/core/error/failures.dart';
import 'package:techmed/features/profile/data/models/change_password_request.dart';
import 'package:techmed/features/profile/data/models/change_password_response/change_password_response.dart';
import 'package:techmed/features/profile/data/models/update_user_request.dart';
import 'package:techmed/features/auth/data/models/user_model/user_model.dart';

abstract class ProfileRepository {
  Future<Either<Failures, ChangePasswordResponse>> changeUserPassword(
    ChangePasswordRequest request,
  );
  Future<Either<Failures, UserModel>> updateUserData(UpdateUserRequest request);
}
