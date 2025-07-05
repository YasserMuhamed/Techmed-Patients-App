import 'package:flutter/material.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/core/helpers/validators.dart';
import 'package:techmed/core/widgets/app_text_field.dart';
import 'package:techmed/core/widgets/back_icon_appbar.dart';
import 'package:techmed/features/profile/presentation/widgets/change_password_button.dart';
import 'package:techmed/generated/l10n.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordConfirmationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackIconAppBar(title: S.of(context).change_password),
                  const SizedBox(height: 24),
                  Text(
                    S.of(context).current_password,
                    style: AppTextStyles.poppins16Medium(context),
                  ),
                  const SizedBox(height: 8),
                  AppTextField(
                    controller: currentPasswordController,
                    hintText: S.of(context).enter_current_password,
                    prefixIcon: const Icon(Icons.lock_outline),
                    validator:
                        (value) =>
                            AppValidators.passwordValidator(value, context),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    S.of(context).new_password,
                    style: AppTextStyles.poppins16Medium(context),
                  ),
                  const SizedBox(height: 8),
                  AppTextField(
                    controller: newPasswordController,
                    hintText: S.of(context).enter_new_password,
                    prefixIcon: const Icon(Icons.lock_outline),
                    validator:
                        (value) =>
                            AppValidators.passwordValidator(value, context),
                  ),

                  const SizedBox(height: 16),
                  Text(
                    S.of(context).confirm_new_password,
                    style: AppTextStyles.poppins16Medium(context),
                  ),
                  const SizedBox(height: 8),
                  AppTextField(
                    controller: newPasswordConfirmationController,
                    hintText: S.of(context).enter_confirm_new_password,
                    prefixIcon: const Icon(Icons.lock_outline),
                    validator:
                        (value) => AppValidators.confirmPasswordValidator(
                          value,
                          newPasswordController.value.text,
                          context,
                        ),
                  ),

                  const SizedBox(height: 32),
                  ChangePasswordButton(
                    formKey: _formKey,
                    setAutovalidateMode: (mode) {
                      setState(() {
                        _autovalidateMode = mode;
                      });
                    },
                    currentPasswordController: currentPasswordController,
                    newPasswordController: newPasswordController,
                    newPasswordConfirmationController:
                        newPasswordConfirmationController,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
