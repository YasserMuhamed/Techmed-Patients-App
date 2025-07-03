import 'package:equatable/equatable.dart';

import 'medication.dart';

class MedicationsResponse extends Equatable {
  final String? message;
  final int? status;
  final List<Medication>? data;

  const MedicationsResponse({this.message, this.status, this.data});

  factory MedicationsResponse.fromJson(Map<String, dynamic> json) {
    return MedicationsResponse(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Medication.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'status': status,
    'data': data?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [message, status, data];
}
