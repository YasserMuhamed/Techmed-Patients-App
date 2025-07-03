import 'package:equatable/equatable.dart';

import 'item.dart';

class Prescription extends Equatable {
  final int? id;
  final int? hospitalId;
  final int? patientId;
  final int? doctorId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Item>? items;

  const Prescription({
    this.id,
    this.hospitalId,
    this.patientId,
    this.doctorId,
    this.createdAt,
    this.updatedAt,
    this.items,
  });

  factory Prescription.fromJson(Map<String, dynamic> json) => Prescription(
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
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'hospitalId': hospitalId,
    'patientId': patientId,
    'doctorId': doctorId,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    'items': items?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props {
    return [id, hospitalId, patientId, doctorId, createdAt, updatedAt, items];
  }
}
