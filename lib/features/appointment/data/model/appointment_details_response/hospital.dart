import 'package:equatable/equatable.dart';

class Hospital extends Equatable {
  final int? id;
  final String? name;
  final String? location;

  const Hospital({this.id, this.name, this.location});

  factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
    id: json['id'] as int?,
    name: json['name'] as String?,
    location: json['location'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'location': location,
  };

  @override
  List<Object?> get props => [id, name, location];
}
