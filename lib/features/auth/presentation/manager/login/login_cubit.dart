import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:techmed/features/auth/data/models/login_request.dart';
import 'package:techmed/features/auth/data/models/login_response/login_response.dart';
import 'package:techmed/features/auth/data/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepository}) : super(LoginInitial());
  final AuthRepository authRepository;

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    final response = await authRepository.login(request);
    response.fold(
      (error) => emit(LoginFailure(errorMessage: error.error)),
      (response) => emit(LoginSuccess(response: response)),
    );
  }
}
