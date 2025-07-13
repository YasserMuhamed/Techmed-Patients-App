part of 'prescription_cubit.dart';

abstract class PrescriptionState extends Equatable {
  const PrescriptionState();

  @override
  List<Object> get props => [];
}

class PrescriptionInitial extends PrescriptionState {}

final class PrescriptionsLoading extends PrescriptionState {}

final class PrescriptionsSuccess extends PrescriptionState {
  final PrescriptionsModel prescriptions;

  const PrescriptionsSuccess(this.prescriptions);

  @override
  List<Object> get props => [prescriptions];
}

final class PrescriptionsFailure extends PrescriptionState {
  final String error;

  const PrescriptionsFailure(this.error);

  @override
  List<Object> get props => [error];
}

final class SinglePrescriptionLoading extends PrescriptionState {}

final class SinglePrescriptionSuccess extends PrescriptionState {
  final PrescriptionDetails prescription;

  const SinglePrescriptionSuccess(this.prescription);

  @override
  List<Object> get props => [prescription];
}

final class SinglePrescriptionFailure extends PrescriptionState {
  final String error;

  const SinglePrescriptionFailure(this.error);

  @override
  List<Object> get props => [error];
}
