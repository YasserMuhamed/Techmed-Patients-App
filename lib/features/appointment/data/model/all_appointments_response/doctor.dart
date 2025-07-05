import 'package:equatable/equatable.dart';

class Doctor extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final String? jobTitle;
  final String? email;
  final String? phoneNumber;

  const Doctor({
    this.id,
    this.name,
    this.image,
    this.jobTitle,
    this.email,
    this.phoneNumber,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json['id'] as int?,
    name: json['name'] as String?,
    image: json['image'] as String?,
    jobTitle: json['jobTitle'] as String?,
    email: json['email'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'jobTitle': jobTitle,
    'email': email,
    'phoneNumber': phoneNumber,
  };

  @override
  List<Object?> get props {
    return [id, name, image, jobTitle, email, phoneNumber];
  }
}
