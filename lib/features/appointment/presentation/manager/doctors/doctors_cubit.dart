import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:techmed/features/appointment/data/model/doctors_model/doctors_model.dart';
import 'package:techmed/features/appointment/data/repository/appointment_repo.dart';

part 'doctors_state.dart';



class DoctorsCubit extends Cubit<DoctorsState> {
  final AppointmentRepository appointmentRepository;
  DoctorsCubit(this.appointmentRepository) : super(DoctorsInitial());

  Future<void> getAllDoctors() async {
    emit(DoctorsLoading());
    final result = await appointmentRepository.getDoctors();
    result.fold(
      (failure) => emit(DoctorsFailure(failure.error)),
      (doctors) => emit(DoctorsSuccess(doctors)),
    );
  }
}
