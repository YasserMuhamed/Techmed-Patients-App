import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final int? id;
  final String? name;
  final String? location;
  final String? logo;
  final String? description;

  const Datum({this.id, this.name, this.location, this.logo, this.description});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'] as int?,
    name: json['name'] as String?,
    location: json['location'] as String?,
    logo: json['logo'] as String?,
    description: json['description'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'location': location,
    'logo': logo,
    'description': description,
  };

  @override
  List<Object?> get props => [id, name, location, logo, description];
}
