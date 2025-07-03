import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techmed/core/helpers/extensions.dart';
import 'package:techmed/core/helpers/toast_helper.dart';
import 'package:techmed/core/widgets/custom_button.dart';
import 'package:techmed/features/Profile/data/models/change_password_request.dart';
import 'package:techmed/features/Profile/presentation/profile_cubit/profile_cubit.dart';
import 'package:techmed/generated/l10n.dart';

class ChangePasswordButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController currentPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController newPasswordConfirmationController;
  final void Function(AutovalidateMode) setAutovalidateMode;

  const ChangePasswordButton({
    super.key,
    required this.formKey,
    required this.setAutovalidateMode,
    required this.currentPasswordController,
    required this.newPasswordController,
    required this.newPasswordConfirmationController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          ToastHelper.showSuccessToast(context, S.of(context).change_password_success);
          context.pop();
        } else if (state is ChangePasswordFailure) {
          ToastHelper.showErrorToast(context, state.error);
        }
      },
      builder: (context, state) {
        if (state is ChangePasswordLoading) {
          return CustomButton(text: "", isLoading: true, onPressed: () {});
        }
        return CustomButton(
          text: S.of(context).change_password,
          onPressed: () {
            ChangePasswordRequest changePasswordRequest = ChangePasswordRequest(
              currentPassword: currentPasswordController.text,
              newPassword: newPasswordController.text,
              newPasswordConfirmation: newPasswordConfirmationController.text,
            );
            if (formKey.currentState!.validate()) {
              BlocProvider.of<ProfileCubit>(context).changeUserPassword(changePasswordRequest);
            } else {
              setAutovalidateMode(AutovalidateMode.onUserInteraction);
            }
          },
        );
      },
    );
  }
}
