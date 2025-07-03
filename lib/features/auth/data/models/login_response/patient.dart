import 'package:equatable/equatable.dart';

class Patient extends Equatable {
  final int? id;
  final String? name;
  final String? phoneNumber;
  final String? email;
  final String? nationalId;
  final String? emergencyContactName;
  final String? emergencyContactPhone;
  final String? allergies;
  final int? age;
  final String? gender;
  final DateTime? birthDate;
  final String? maritalStatus;
  final dynamic image;
  final dynamic nationalIdImage;
  final dynamic birthCertificateImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Patient({
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.nationalId,
    this.emergencyContactName,
    this.emergencyContactPhone,
    this.allergies,
    this.age,
    this.gender,
    this.birthDate,
    this.maritalStatus,
    this.image,
    this.nationalIdImage,
    this.birthCertificateImage,
    this.createdAt,
    this.updatedAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json['id'] as int?,
    name: json['name'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    email: json['email'] as String?,
    nationalId: json['nationalId'] as String?,
    emergencyContactName: json['emergencyContactName'] as String?,
    emergencyContactPhone: json['emergencyContactPhone'] as String?,
    allergies: json['allergies'] as String?,
    age: json['age'] as int?,
    gender: json['gender'] as String?,
    birthDate:
        json['birthDate'] == null
            ? null
            : DateTime.parse(json['birthDate'] as String),
    maritalStatus: json['maritalStatus'] as String?,
    image: json['image'] as dynamic,
    nationalIdImage: json['nationalIdImage'] as dynamic,
    birthCertificateImage: json['birthCertificateImage'] as dynamic,
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
    'name': name,
    'phoneNumber': phoneNumber,
    'email': email,
    'nationalId': nationalId,
    'emergencyContactName': emergencyContactName,
    'emergencyContactPhone': emergencyContactPhone,
    'allergies': allergies,
    'age': age,
    'gender': gender,
    'birthDate': birthDate?.toIso8601String(),
    'maritalStatus': maritalStatus,
    'image': image,
    'nationalIdImage': nationalIdImage,
    'birthCertificateImage': birthCertificateImage,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      phoneNumber,
      email,
      nationalId,
      emergencyContactName,
      emergencyContactPhone,
      allergies,
      age,
      gender,
      birthDate,
      maritalStatus,
      image,
      nationalIdImage,
      birthCertificateImage,
      createdAt,
      updatedAt,
    ];
  }
}
