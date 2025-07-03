import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final int? id;
  final int? quantity;
  final String? dosage;
  final String? duration;
  final String? notes;
  final int? timesPerDay;
  final int? medicineId;
  final int? prescriptionId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Item({
    this.id,
    this.quantity,
    this.dosage,
    this.duration,
    this.notes,
    this.timesPerDay,
    this.medicineId,
    this.prescriptionId,
    this.createdAt,
    this.updatedAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json['id'] as int?,
    quantity: json['quantity'] as int?,
    dosage: json['dosage'] as String?,
    duration: json['duration'] as String?,
    notes: json['notes'] as String?,
    timesPerDay: json['timesPerDay'] as int?,
    medicineId: json['medicineId'] as int?,
    prescriptionId: json['prescriptionId'] as int?,
    createdAt:
        json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
    updatedAt:
        json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'quantity': quantity,
    'dosage': dosage,
    'duration': duration,
    'notes': notes,
    'timesPerDay': timesPerDay,
    'medicineId': medicineId,
    'prescriptionId': prescriptionId,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      quantity,
      dosage,
      duration,
      notes,
      timesPerDay,
      medicineId,
      prescriptionId,
      createdAt,
      updatedAt,
    ];
  }
}
