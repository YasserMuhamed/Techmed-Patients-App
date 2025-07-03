import 'package:equatable/equatable.dart';

import 'user_data.dart';

class UserModel extends Equatable {
  final String? message;
  final int? status;
  final UserData? data;

  const UserModel({this.message, this.status, this.data});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    message: json['message'] as String?,
    status: json['status'] as int?,
    data:
        json['data'] == null
            ? null
            : UserData.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'message': message,
    'status': status,
    'data': data?.toJson(),
  };

  @override
  List<Object?> get props => [message, status, data];
}
