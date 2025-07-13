import 'package:equatable/equatable.dart';

import 'doctor.dart';
import 'hospital.dart';
import 'item.dart';

class Datum extends Equatable {
  final int? id;
  final int? hospitalId;
  final int? patientId;
  final int? doctorId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Item>? items;
  final Hospital? hospital;
  final Doctor? doctor;

  const Datum({
    this.id,
    this.hospitalId,
    this.patientId,
    this.doctorId,
    this.createdAt,
    this.updatedAt,
    this.items,
    this.hospital,
    this.doctor,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'] as int?,
    hospitalId: json['hospitalId'] as int?,
    patientId: json['patientId'] as int?,
    doctorId: json['doctorId'] as int?,
    createdAt:
        json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
    updatedAt:
        json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
    items:
        (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
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
    'hospitalId': hospitalId,
    'patientId': patientId,
    'doctorId': doctorId,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    'items': items?.map((e) => e.toJson()).toList(),
    'hospital': hospital?.toJson(),
    'doctor': doctor?.toJson(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      hospitalId,
      patientId,
      doctorId,
      createdAt,
      updatedAt,
      items,
      hospital,
      doctor,
    ];
  }
}
