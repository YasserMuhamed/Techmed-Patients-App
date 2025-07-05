import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:techmed/features/medication/data/repository/medication_repo.dart';
import 'package:techmed/features/medication/data/model/prescriptions_response/prescriptions_response.dart';

part 'prescriptions_state.dart';

class PrescriptionsCubit extends Cubit<PrescriptionsState> {
  PrescriptionsCubit(this.medicationRepo) : super(PrescriptionsInitial());

  final MedicationRepo medicationRepo;

  Future<void> getPrescriptions() async {
    emit(PrescriptionsLoading());
    final response = await medicationRepo.getPrescriptions();
    response.fold(
      (failure) => emit(PrescriptionsFailure(failure.error)),
      (prescriptions) => emit(PrescriptionsSuccess(prescriptions)),
    );
  }
}
