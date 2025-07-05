import 'package:equatable/equatable.dart';

class CreateAppointmentRequest extends Equatable {
  final String? date;
  final String? time;
  final String? status;
  final int? doctorId;
  final int? hospitalId;

  const CreateAppointmentRequest({
    this.date,
    this.time,
    this.status,
    this.doctorId,
    this.hospitalId,
  });

  factory CreateAppointmentRequest.fromJson(Map<String, dynamic> json) {
    return CreateAppointmentRequest(
      date: json['date'] as String?,
      time: json['time'] as String?,
      status: json['status'] as String?,
      doctorId: json['doctorId'] as int?,
      hospitalId: json['hospitalId'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'date': date,
    'time': time,
    'status': status,
    'doctorId': doctorId,
    'hospitalId': hospitalId,
  };

  @override
  List<Object?> get props => [date, time, status, doctorId, hospitalId];
}
