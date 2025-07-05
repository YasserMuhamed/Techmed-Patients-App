import 'package:equatable/equatable.dart';

class Doctor extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final String? jobTitle;
  final String? email;

  const Doctor({this.id, this.name, this.image, this.jobTitle, this.email});

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json['id'] as int?,
    name: json['name'] as String?,
    image: json['image'] as String?,
    jobTitle: json['jobTitle'] as String?,
    email: json['email'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'jobTitle': jobTitle,
    'email': email,
  };

  @override
  List<Object?> get props => [id, name, image, jobTitle, email];
}
