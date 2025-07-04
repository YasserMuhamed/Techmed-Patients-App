import 'package:equatable/equatable.dart';

class UpdateUserRequest extends Equatable {
  final String? name;
  final String? phoneNumber;
  final String? emergencyContactName;
  final String? emergencyContactPhone;
  final String? allergies;
  final int? age;
  final DateTime? birthDate;
  final String? maritalStatus;

  const UpdateUserRequest({
    this.name,
    this.phoneNumber,
    this.emergencyContactName,
    this.emergencyContactPhone,
    this.allergies,
    this.age,
    this.birthDate,
    this.maritalStatus,
  });

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) {
    return UpdateUserRequest(
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      emergencyContactName: json['emergencyContactName'] as String?,
      emergencyContactPhone: json['emergencyContactPhone'] as String?,
      allergies: json['allergies'] as String?,
      age: json['age'] as int?,
      birthDate:
          json['birthDate'] == null
              ? null
              : DateTime.parse(json['birthDate'] as String),
      maritalStatus: json['maritalStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'phoneNumber': phoneNumber,
    'emergencyContactName': emergencyContactName,
    'emergencyContactPhone': emergencyContactPhone,
    'allergies': allergies,
    'age': age,
    'birthDate': birthDate?.toIso8601String(),
    'maritalStatus': maritalStatus,
  };

  @override
  List<Object?> get props {
    return [
      name,
      phoneNumber,
      emergencyContactName,
      emergencyContactPhone,
      allergies,
      age,
      birthDate,
      maritalStatus,
    ];
  }
}
