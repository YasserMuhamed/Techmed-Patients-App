import 'package:equatable/equatable.dart';

import 'patient.dart';

class Data extends Equatable {
  final String? token;
  final Patient? patient;

  const Data({this.token, this.patient});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json['token'] as String?,
    patient:
        json['patient'] == null
            ? null
            : Patient.fromJson(json['patient'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'token': token,
    'patient': patient?.toJson(),
  };

  @override
  List<Object?> get props => [token, patient];
}
