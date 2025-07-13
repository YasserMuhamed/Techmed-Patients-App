part of 'vaccination_cubit.dart';

sealed class VaccinationState extends Equatable {
  const VaccinationState();

  @override
  List<Object> get props => [];
}

final class _VaccinationInitial extends VaccinationState {}

final class VaccinationLoading extends VaccinationState {}

final class VaccinationSuccess extends VaccinationState {
  final VaccinationModel vaccinations;

  const VaccinationSuccess(this.vaccinations);

  @override
  List<Object> get props => [vaccinations];
}

final class VaccinationFailure extends VaccinationState {
  final String message;

  const VaccinationFailure(this.message);

  @override
  List<Object> get props => [message];
}

// States for creating a vaccination
final class VaccinationCreateLoading extends VaccinationState {}

final class VaccinationCreateSuccess extends VaccinationState {}

final class VaccinationCreateFailure extends VaccinationState {
  final String message;

  const VaccinationCreateFailure(this.message);

  @override
  List<Object> get props => [message];
}

// States for deleting a vaccination
final class VaccinationDeleteLoading extends VaccinationState {}

final class VaccinationDeleteSuccess extends VaccinationState {}

final class VaccinationDeleteFailure extends VaccinationState {
  final String message;

  const VaccinationDeleteFailure(this.message);

  @override
  List<Object> get props => [message];
}

// States for getting a single vaccination
final class VaccinationDetailsLoading extends VaccinationState {}

final class VaccinationDetailsSuccess extends VaccinationState {
  final VaccinationDetails vaccination;

  const VaccinationDetailsSuccess(this.vaccination);

  @override
  List<Object> get props => [vaccination];
}

final class VaccinationDetailsFailure extends VaccinationState {
  final String message;

  const VaccinationDetailsFailure(this.message);

  @override
  List<Object> get props => [message];
}
