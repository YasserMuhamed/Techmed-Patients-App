import 'package:equatable/equatable.dart';

import 'datum.dart';

class PrescriptionsModel extends Equatable {
  final String? message;
  final int? status;
  final List<Datum>? data;

  const PrescriptionsModel({this.message, this.status, this.data});

  factory PrescriptionsModel.fromJson(Map<String, dynamic> json) {
    return PrescriptionsModel(
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
