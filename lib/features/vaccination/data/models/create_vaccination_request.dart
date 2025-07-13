import 'package:equatable/equatable.dart';

class CreateVaccinationRequest extends Equatable {
  final String? vaccineName;
  final DateTime? vaccineDate;
  final String? vaccineNotes;

  const CreateVaccinationRequest({
    this.vaccineName,
    this.vaccineDate,
    this.vaccineNotes,
  });

  factory CreateVaccinationRequest.fromJson(Map<String, dynamic> json) {
    return CreateVaccinationRequest(
      vaccineName: json['vaccineName'] as String?,
      vaccineDate:
          json['vaccineDate'] == null
              ? null
              : DateTime.parse(json['vaccineDate'] as String),
      vaccineNotes: json['vaccineNotes'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'vaccineName': vaccineName,
    'vaccineDate': vaccineDate?.toIso8601String(),
    'vaccineNotes': vaccineNotes,
  };

  @override
  List<Object?> get props => [vaccineName, vaccineDate, vaccineNotes];
}
