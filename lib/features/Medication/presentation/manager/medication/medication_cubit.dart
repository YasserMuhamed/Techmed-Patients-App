import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:techmed/features/medication/data/model/create_medication_request.dart';
import 'package:techmed/features/medication/data/model/medication_details_response/medication_details_response.dart';
import 'package:techmed/features/medication/data/model/medications_response/medications_response.dart';
import 'package:techmed/features/medication/data/model/medicines_model/medicines_model.dart';
import 'package:techmed/features/medication/data/repository/medication_repo.dart';

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

  Future<void> getMedicationDetails(int medicationId) async {
    emit(MedicationDetailsLoading());
    final response = await medicationRepo.getSingleMedication(medicationId);
    response.fold(
      (failure) => emit(MedicationDetailsFailure(failure.error)),
      (medication) => emit(MedicationDetailsSuccess(medication)),
    );
  }

  Future<void> createMedication(CreateMedicationRequest medicationData) async {
    emit(MedicationCreateLoading());
    final response = await medicationRepo.createMedication(medicationData);
    response.fold(
      (failure) => emit(MedicationCreateFailure(failure.error)),
      (data) => emit(MedicationCreateSuccess()),
    );
  }

  Future<void> deleteMedication(int medicationId) async {
    emit(MedicationDeleteLoading());
    final response = await medicationRepo.deleteMedication(medicationId);
    response.fold(
      (failure) => emit(MedicationDeleteFailure(failure.error)),
      (data) => emit(MedicationDeleteSuccess()),
    );
  }

  Future<void> getAllMedicines() async {
    emit(MedicinesLoading());
    final response = await medicationRepo.getAllMedicines();
    response.fold(
      (failure) => emit(MedicinesFailure(failure.error)),
      (medicines) => emit(MedicinesSuccess(medicines)),
    );
  }
}
