import 'package:equatable/equatable.dart';

class RegisterRequest extends Equatable {
  final String? name;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final String? nationalId;
  final String? gender;

  const RegisterRequest({
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.nationalId,
    this.gender,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      nationalId: json['nationalId'] as String?,
      gender: json['gender'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'phoneNumber': phoneNumber,
    'nationalId': nationalId,
    'gender': gender,
  };

  @override
  List<Object?> get props {
    return [name, email, password, phoneNumber, nationalId, gender];
  }
}
