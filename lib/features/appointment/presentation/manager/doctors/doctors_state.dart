part of 'doctors_cubit.dart';

abstract class DoctorsState extends Equatable {
  const DoctorsState();

  @override
  List<Object?> get props => [];
}

class DoctorsInitial extends DoctorsState {}

class DoctorsLoading extends DoctorsState {}

class DoctorsSuccess extends DoctorsState {
  final DoctorsModel doctors;
  const DoctorsSuccess(this.doctors);

  @override
  List<Object?> get props => [doctors];
}

class DoctorsFailure extends DoctorsState {
  final String message;
  const DoctorsFailure(this.message);

  @override
  List<Object?> get props => [message];
}
