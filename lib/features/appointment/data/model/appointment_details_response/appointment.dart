import 'package:equatable/equatable.dart';

import 'doctor.dart';
import 'hospital.dart';

class Appointment extends Equatable {
  final int? id;
  final DateTime? date;
  final String? time;
  final String? status;
  final int? patientId;
  final int? doctorId;
  final int? hospitalId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Hospital? hospital;
  final Doctor? doctor;

  const Appointment({
    this.id,
    this.date,
    this.time,
    this.status,
    this.patientId,
    this.doctorId,
    this.hospitalId,
    this.createdAt,
    this.updatedAt,
    this.hospital,
    this.doctor,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
    id: json['id'] as int?,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    time: json['time'] as String?,
    status: json['status'] as String?,
    patientId: json['patientId'] as int?,
    doctorId: json['doctorId'] as int?,
    hospitalId: json['hospitalId'] as int?,
    createdAt:
        json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
    updatedAt:
        json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
    hospital:
        json['hospital'] == null
            ? null
            : Hospital.fromJson(json['hospital'] as Map<String, dynamic>),
    doctor:
        json['doctor'] == null
            ? null
            : Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date?.toIso8601String(),
    'time': time,
    'status': status,
    'patientId': patientId,
    'doctorId': doctorId,
    'hospitalId': hospitalId,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    'hospital': hospital?.toJson(),
    'doctor': doctor?.toJson(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      date,
      time,
      status,
      patientId,
      doctorId,
      hospitalId,
      createdAt,
      updatedAt,
      hospital,
      doctor,
    ];
  }
}
