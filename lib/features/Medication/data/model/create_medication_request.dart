import 'package:equatable/equatable.dart';

class CreateMedicationRequest extends Equatable {
  final String? dosage;
  final String? startDate;
  final String? endDate;
  final String? notes;
  final int? medicineId;

  const CreateMedicationRequest({
    this.dosage,
    this.startDate,
    this.endDate,
    this.notes,
    this.medicineId,
  });

  factory CreateMedicationRequest.fromJson(Map<String, dynamic> json) {
    return CreateMedicationRequest(
      dosage: json['dosage'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      notes: json['notes'] as String?,
      medicineId: json['medicineId'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'dosage': dosage,
    'startDate': startDate,
    'endDate': endDate,
    'notes': notes,
    'medicineId': medicineId,
  };

  @override
  List<Object?> get props {
    return [dosage, startDate, endDate, notes, medicineId];
  }
}
