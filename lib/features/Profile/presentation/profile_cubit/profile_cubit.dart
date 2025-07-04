import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:techmed/features/Profile/data/models/change_password_request.dart';
import 'package:techmed/features/Profile/data/models/update_user_request.dart';
import 'package:techmed/features/Profile/data/repositories/profile_repository.dart';
import 'package:techmed/features/auth/data/models/user_model/user_model.dart';
import 'package:techmed/features/auth/data/repositories/auth_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.authRepository, required this.profileRepository})
    : super(ProfileInitial());
  final AuthRepository authRepository;
  final ProfileRepository profileRepository;

  Future<void> getUserProfile() async {
    emit(ProfileLoading());
    final result = await authRepository.getUserProfile();
    result.fold(
      (failure) => emit(ProfileFailure(failure.error)),
      (user) => emit(ProfileSuccess(user)),
    );
  }

  Future<void> changeUserPassword(ChangePasswordRequest request) async {
    emit(ChangePasswordLoading());
    final result = await profileRepository.changeUserPassword(request);

    result.fold(
      (failure) => emit(ChangePasswordFailure(failure.error)),
      (result) => emit(ChangePasswordSuccess()),
    );
  }

  Future<void> updateUserData(UpdateUserRequest request) async {
    emit(UpdateUserDataLoading());
    final result = await profileRepository.updateUserData(request);

    result.fold(
      (failure) => emit(UpdateUserDataFailure(failure.error)),
      (updatedUser) => emit(UpdateUserDataSuccess()),
    );
  }
}
