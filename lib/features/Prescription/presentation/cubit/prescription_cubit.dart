import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:techmed/features/Prescription/data/models/prescription_details/prescription_details.dart';
import 'package:techmed/features/Prescription/data/models/prescriptions_model/prescriptions_model.dart';
import 'package:techmed/features/Prescription/data/repositories/prescription_repository.dart';

part 'prescription_state.dart';

class PrescriptionCubit extends Cubit<PrescriptionState> {
  PrescriptionCubit(this.prescriptionRepository) : super(PrescriptionInitial());
  final PrescriptionRepository prescriptionRepository;
  Future<void> getPrescriptions() async {
    emit(PrescriptionsLoading());
    final eitherResponse = await prescriptionRepository.getPrescriptions();
    eitherResponse.fold(
      (failure) => emit(PrescriptionsFailure(failure.error)),
      (prescriptions) => emit(PrescriptionsSuccess(prescriptions)),
    );
  }

  Future<void> getSinglePrescription(int id) async {
    emit(SinglePrescriptionLoading());
    final eitherResponse = await prescriptionRepository.getSinglePrescription(id);
    eitherResponse.fold(
      (failure) => emit(SinglePrescriptionFailure(failure.error)),
      (prescriptionDetails) => emit(SinglePrescriptionSuccess(prescriptionDetails)),
    );
  }
}
