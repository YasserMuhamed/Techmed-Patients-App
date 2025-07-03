import 'package:equatable/equatable.dart';

class RegisterRequest extends Equatable {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final String nationalId;
  final String emergencyContactName;
  final String emergencyContactPhone;
  final String allergies;
  final String gender;
  final int age;
  final String? birthDate;
  final String? maritalStatus;

  const RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.nationalId,
    required this.emergencyContactName,
    required this.emergencyContactPhone,
    required this.allergies,
    required this.gender,
    required this.age,
    this.birthDate,
    this.maritalStatus,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phoneNumber: json['phoneNumber'] as String,
      nationalId: json['nationalId'] as String,
      emergencyContactName: json['emergencyContactName'] as String,
      emergencyContactPhone: json['emergencyContactPhone'] as String,
      allergies: json['allergies'] as String,
      gender: json['gender'] as String,
      age: json['age'] as int,
      birthDate: json['birthDate'] as String?,
      maritalStatus: json['maritalStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'phoneNumber': phoneNumber,
    'nationalId': nationalId,
    'emergencyContactName': emergencyContactName,
    'emergencyContactPhone': emergencyContactPhone,
    'allergies': allergies,
    'gender': gender,
    'age': age,
    'birthDate': birthDate,
    'maritalStatus': maritalStatus,
  };

  @override
  List<Object?> get props {
    return [
      name,
      email,
      password,
      phoneNumber,
      nationalId,
      emergencyContactName,
      emergencyContactPhone,
      allergies,
      gender,
      age,
      birthDate,
      maritalStatus,
    ];
  }
}
