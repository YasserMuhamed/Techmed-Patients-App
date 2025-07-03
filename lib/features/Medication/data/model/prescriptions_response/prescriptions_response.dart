import 'package:equatable/equatable.dart';

import 'prescription.dart';

class PrescriptionsResponse extends Equatable {
  final String? message;
  final int? status;
  final List<Prescription>? data;

  const PrescriptionsResponse({this.message, this.status, this.data});

  factory PrescriptionsResponse.fromJson(Map<String, dynamic> json) {
    return PrescriptionsResponse(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Prescription.fromJson(e as Map<String, dynamic>))
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
