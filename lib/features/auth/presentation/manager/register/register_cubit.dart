import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:techmed/features/auth/data/models/register_request.dart';
import 'package:techmed/features/auth/data/repositories/auth_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.authRepository}) : super(_RegisterInitial());
  final AuthRepository authRepository;

  Future<void> register(RegisterRequest req) async {
    emit(RegisterLoading());
    final result = await authRepository.register(req);
    result.fold(
      (failure) => emit(RegisterFailure(failure.error)),
      (response) => emit(RegisterSuccess()),
    );
  }
}
