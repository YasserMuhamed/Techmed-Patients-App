part of 'prescriptions_cubit.dart';

sealed class PrescriptionsState extends Equatable {
  const PrescriptionsState();

  @override
  List<Object> get props => [];
}

final class PrescriptionsInitial extends PrescriptionsState {}

final class PrescriptionsLoading extends PrescriptionsState {}

final class PrescriptionsSuccess extends PrescriptionsState {
  final PrescriptionsResponse prescriptions;

  const PrescriptionsSuccess(this.prescriptions);

  @override
  List<Object> get props => [prescriptions];
}

final class PrescriptionsFailure extends PrescriptionsState {
  final String error;

  const PrescriptionsFailure(this.error);

  @override
  List<Object> get props => [error];
}
