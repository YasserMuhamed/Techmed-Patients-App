import 'package:equatable/equatable.dart';

import 'data.dart';

class MedicinesModel extends Equatable {
  final String? message;
  final int? status;
  final Data? data;

  const MedicinesModel({this.message, this.status, this.data});

  factory MedicinesModel.fromJson(Map<String, dynamic> json) {
    return MedicinesModel(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data:
          json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'status': status,
    'data': data?.toJson(),
  };

  @override
  List<Object?> get props => [message, status, data];
}
