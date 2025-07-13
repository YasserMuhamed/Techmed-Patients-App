import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techmed/Core/helpers/shared_pref_helper.dart';
import 'package:techmed/configs/routing/app_routes.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_paddings.dart';
import 'package:techmed/core/api/dio_factory.dart';
import 'package:techmed/core/helpers/extensions.dart';
import 'package:techmed/core/helpers/shared_prefs_keys.dart';
import 'package:techmed/core/helpers/toast_helper.dart';
import 'package:techmed/core/helpers/validators.dart';
import 'package:techmed/core/widgets/app_text_field.dart';
import 'package:techmed/core/widgets/custom_button.dart';
import 'package:techmed/features/auth/data/models/login_request.dart';
import 'package:techmed/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:techmed/generated/l10n.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          AppTextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => AppValidators.emailValidator(value, context),
            prefixIcon: Icon(Icons.email_outlined, color: AppColors.iconColor),
            hintText: S.of(context).enter_your_email,
          ),
          AppPaddings.gap24.verticalSpace,
          AppTextField(
            controller: passwordController,
            maxLines: isObscure ? 1 : 1,
            keyboardType: TextInputType.visiblePassword,
            validator:
                (value) => AppValidators.passwordValidator(value, context),
            prefixIcon: Icon(Icons.lock_outline, color: AppColors.iconColor),
            hintText: S.of(context).enter_your_password,
            obscureText: isObscure,
            suffixIcon: IconButton(
              icon: Icon(
                isObscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.iconColor,
              ),
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
            ),
          ),
          AppPaddings.gap32.verticalSpace,
          LoginButton(
            formKey: _formKey,
            emailController: emailController,
            passwordController: passwordController,
            setAutovalidateMode: (mode) {
              setState(() {
                _autovalidateMode = mode;
              });
            },
          ),
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function(AutovalidateMode) setAutovalidateMode;

  const LoginButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.setAutovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          DioFactory.setTokenIntoHeaderAfterLogin(state.response.data!.token!);
          SharedPrefHelper.setSecuredString(
            SharedPrefsKeys.tokenKey,
            state.response.data!.token!,
          );
          context.pushReplacementNamed(AppRoutes.kMainScreen);
        } else if (state is LoginFailure) {
          ToastHelper.showErrorToast(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return CustomButton(
            text: S.of(context).login,
            isLoading: true,
            onPressed: () {},
          );
        }
        return CustomButton(
          text: S.of(context).login,
          onPressed: () {
            LoginRequest loginRequest = LoginRequest(
              email: emailController.text,
              password: passwordController.text,
            );
            if (formKey.currentState!.validate()) {
              BlocProvider.of<LoginCubit>(context).login(loginRequest);
            } else {
              setAutovalidateMode(AutovalidateMode.onUserInteraction);
            }
          },
        );
      },
    );
  }
}
