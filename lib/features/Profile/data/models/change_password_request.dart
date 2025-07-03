import 'package:equatable/equatable.dart';

class ChangePasswordRequest extends Equatable {
  final String? currentPassword;
  final String? newPassword;
  final String? newPasswordConfirmation;

  const ChangePasswordRequest({
    this.currentPassword,
    this.newPassword,
    this.newPasswordConfirmation,
  });

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) {
    return ChangePasswordRequest(
      currentPassword: json['currentPassword'] as String?,
      newPassword: json['newPassword'] as String?,
      newPasswordConfirmation: json['newPasswordConfirmation'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'currentPassword': currentPassword,
    'newPassword': newPassword,
    'newPasswordConfirmation': newPasswordConfirmation,
  };

  @override
  List<Object?> get props {
    return [currentPassword, newPassword, newPasswordConfirmation];
  }
}
