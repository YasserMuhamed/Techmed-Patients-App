import 'package:equatable/equatable.dart';

import 'patient.dart';

class RegisterResponse extends Equatable {
  final String? message;
  final Patient? patient;

  const RegisterResponse({this.message, this.patient});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['message'] as String?,
      patient:
          json['patient'] == null
              ? null
              : Patient.fromJson(json['patient'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'patient': patient?.toJson(),
  };

  @override
  List<Object?> get props => [message, patient];
}
