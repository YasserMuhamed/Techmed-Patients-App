import 'package:equatable/equatable.dart';

import 'datum.dart';

class HospitalsModel extends Equatable {
  final String? message;
  final int? status;
  final List<Datum>? data;

  const HospitalsModel({this.message, this.status, this.data});

  factory HospitalsModel.fromJson(Map<String, dynamic> json) {
    return HospitalsModel(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'status': status,
    'data': data?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [message, status, data];
}
