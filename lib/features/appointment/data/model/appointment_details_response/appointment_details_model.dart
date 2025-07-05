import 'package:equatable/equatable.dart';

import 'appointment.dart';

class AppointmentDetailsModel extends Equatable {
  final String? message;
  final int? status;
  final Appointment? data;

  const AppointmentDetailsModel({this.message, this.status, this.data});

  factory AppointmentDetailsModel.fromJson(Map<String, dynamic> json) {
    return AppointmentDetailsModel(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data:
          json['data'] == null
              ? null
              : Appointment.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'status': status,
    'data': data?.toJson(),
  };

  @override
  List<Object?> get props => [message, status, data];
}
