part of 'medication_cubit.dart';

sealed class MedicationState extends Equatable {
  const MedicationState();

  @override
  List<Object> get props => [];
}

final class _MedicationInitial extends MedicationState {}

final class MedicationLoading extends MedicationState {}

final class MedicationSuccess extends MedicationState {
  final MedicationsResponse medications;

  const MedicationSuccess(this.medications);

  @override
  List<Object> get props => [medications];
}

final class MedicationFailure extends MedicationState {
  final String message;

  const MedicationFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class PrescriptionLoading extends MedicationState {}

final class PrescriptionSuccess extends MedicationState {
  final PrescriptionsResponse prescriptions;

  const PrescriptionSuccess(this.prescriptions);

  @override
  List<Object> get props => [prescriptions];
}

final class PrescriptionFailure extends MedicationState {
  final String message;

  const PrescriptionFailure(this.message);

  @override
  List<Object> get props => [message];
}
