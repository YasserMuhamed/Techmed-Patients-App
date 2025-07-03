import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:techmed/Features/Medication/data/model/medications_response/medications_response.dart';
import 'package:techmed/Features/Medication/data/model/prescriptions_response/prescriptions_response.dart';
import 'package:techmed/Features/Medication/data/repository/medication_repo.dart';

part 'medication_state.dart';

class MedicationCubit extends Cubit<MedicationState> {
  MedicationCubit(this.medicationRepo) : super(_MedicationInitial());
  final MedicationRepo medicationRepo;

  Future<void> getMedications() async {
    emit(MedicationLoading());
    final response = await medicationRepo.getMedications();
    response.fold(
      (failure) => emit(MedicationFailure(failure.error)),
      (medications) => emit(MedicationSuccess(medications)),
    );
  }

  Future<void> getPrescriptions() async {
    emit(PrescriptionLoading());
    final response = await medicationRepo.getPrescriptions();
    response.fold(
      (failure) => emit(PrescriptionFailure(failure.error)),
      (prescriptions) => emit(PrescriptionSuccess(prescriptions)),
    );
  }
}
