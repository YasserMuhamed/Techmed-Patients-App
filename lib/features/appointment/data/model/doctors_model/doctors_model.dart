import 'package:equatable/equatable.dart';

import 'data.dart';

class DoctorsModel extends Equatable {
  final String? message;
  final int? status;
  final Data? data;

  const DoctorsModel({this.message, this.status, this.data});

  factory DoctorsModel.fromJson(Map<String, dynamic> json) => DoctorsModel(
    message: json['message'] as String?,
    status: json['status'] as int?,
    data:
        json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'message': message,
    'status': status,
    'data': data?.toJson(),
  };

  @override
  List<Object?> get props => [message, status, data];
}
