import 'package:equatable/equatable.dart';

class Doctor extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? jobTitle;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Doctor({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.jobTitle,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    jobTitle: json['jobTitle'] as String?,
    image: json['image'] as String?,
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
    'email': email,
    'phoneNumber': phoneNumber,
    'jobTitle': jobTitle,
    'image': image,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      phoneNumber,
      jobTitle,
      image,
      createdAt,
      updatedAt,
    ];
  }
}
