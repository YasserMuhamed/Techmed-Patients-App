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

// States for creating a medication
final class MedicationCreateLoading extends MedicationState {}

final class MedicationCreateSuccess extends MedicationState {}

final class MedicationCreateFailure extends MedicationState {
  final String message;

  const MedicationCreateFailure(this.message);

  @override
  List<Object> get props => [message];
}

// States for deleting a medication
final class MedicationDeleteLoading extends MedicationState {}

final class MedicationDeleteSuccess extends MedicationState {}

final class MedicationDeleteFailure extends MedicationState {
  final String message;

  const MedicationDeleteFailure(this.message);

  @override
  List<Object> get props => [message];
}

// States for getting medicines
final class MedicinesLoading extends MedicationState {}

final class MedicinesSuccess extends MedicationState {
  final MedicinesModel medicines;

  const MedicinesSuccess(this.medicines);

  @override
  List<Object> get props => [medicines];
}

final class MedicinesFailure extends MedicationState {
  final String message;

  const MedicinesFailure(this.message);

  @override
  List<Object> get props => [message];
}

// States for getting a single medication
final class MedicationDetailsLoading extends MedicationState {}

final class MedicationDetailsSuccess extends MedicationState {
  final MedicationDetailsResponse medication;

  const MedicationDetailsSuccess(this.medication);

  @override
  List<Object> get props => [medication];
}

final class MedicationDetailsFailure extends MedicationState {
  final String message;

  const MedicationDetailsFailure(this.message);

  @override
  List<Object> get props => [message];
}
