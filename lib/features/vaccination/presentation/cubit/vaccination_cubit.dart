import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:techmed/features/vaccination/data/models/vaccination_model/vaccination_model.dart';
import 'package:techmed/features/vaccination/data/models/vaccination_details/vaccination_details.dart';
import 'package:techmed/features/vaccination/data/models/create_vaccination_request.dart';
import 'package:techmed/features/vaccination/data/repository/vaccination_repo.dart';

part 'vaccination_state.dart';

class VaccinationCubit extends Cubit<VaccinationState> {
  VaccinationCubit(this.vaccinationRepo) : super(_VaccinationInitial());
  final VaccinationRepo vaccinationRepo;

  Future<void> getVaccinations() async {
    emit(VaccinationLoading());
    final response = await vaccinationRepo.getVaccinations();
    response.fold(
      (failure) => emit(VaccinationFailure(failure.error)),
      (vaccinations) => emit(VaccinationSuccess(vaccinations)),
    );
  }

  Future<void> getVaccinationDetails(int vaccinationId) async {
    emit(VaccinationDetailsLoading());
    final response = await vaccinationRepo.getSingleVaccination(vaccinationId);
    response.fold(
      (failure) => emit(VaccinationDetailsFailure(failure.error)),
      (vaccination) => emit(VaccinationDetailsSuccess(vaccination)),
    );
  }

  Future<void> createVaccination(
    CreateVaccinationRequest vaccinationData,
  ) async {
    emit(VaccinationCreateLoading());
    final response = await vaccinationRepo.createVaccination(vaccinationData);
    response.fold(
      (failure) => emit(VaccinationCreateFailure(failure.error)),
      (data) => emit(VaccinationCreateSuccess()),
    );
  }

  Future<void> deleteVaccination(int vaccinationId) async {
    emit(VaccinationDeleteLoading());
    final response = await vaccinationRepo.deleteVaccination(vaccinationId);
    response.fold(
      (failure) => emit(VaccinationDeleteFailure(failure.error)),
      (data) => emit(VaccinationDeleteSuccess()),
    );
  }
}
