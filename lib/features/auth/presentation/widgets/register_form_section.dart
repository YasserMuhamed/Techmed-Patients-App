import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_paddings.dart';
import 'package:techmed/core/helpers/extensions.dart';
import 'package:techmed/core/helpers/toast_helper.dart';
import 'package:techmed/core/helpers/validators.dart';
import 'package:techmed/core/widgets/app_text_field.dart';
import 'package:techmed/core/widgets/custom_button.dart';
import 'package:techmed/features/Profile/presentation/widgets/gender_widget.dart';
import 'package:techmed/features/auth/data/models/register_request.dart';
import 'package:techmed/features/auth/presentation/manager/register/register_cubit.dart';
import 'package:techmed/generated/l10n.dart';

class RegisterFormSection extends StatefulWidget {
  const RegisterFormSection({super.key});

  @override
  State<RegisterFormSection> createState() => _RegisterFormSectionState();
}

class _RegisterFormSectionState extends State<RegisterFormSection> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController genderController = TextEditingController();

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
            controller: nameController,
            keyboardType: TextInputType.name,
            validator: (value) => AppValidators.nameValidator(value, context),
            prefixIcon: Icon(Icons.person_outline, color: AppColors.iconColor),
            hintText: S.of(context).enter_your_name,
          ),
          AppPaddings.gap24.verticalSpace,
          AppTextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => AppValidators.emailValidator(value, context),
            prefixIcon: Icon(Icons.email_outlined, color: AppColors.iconColor),
            hintText: S.of(context).enter_your_email,
          ),
          AppPaddings.gap24.verticalSpace,
          AppTextField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            validator: (value) => AppValidators.phoneValidator(value, context),
            prefixIcon: Icon(Icons.phone_android_outlined, color: AppColors.iconColor),
            hintText: S.of(context).enter_your_phone,
          ),
          AppPaddings.gap24.verticalSpace,
          AppTextField(
            controller: passwordController,
            maxLines: isObscure ? 1 : 1,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) => AppValidators.passwordValidator(value, context),
            prefixIcon: Icon(Icons.lock_outline, color: AppColors.iconColor),
            hintText: S.of(context).enter_your_password,
            obscureText: isObscure,
            suffixIcon: IconButton(
              icon: Icon(isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: AppColors.iconColor),
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
            ),
          ),
          AppPaddings.gap24.verticalSpace,
          AppTextField(
            controller: nationalIdController,
            keyboardType: TextInputType.number,
            validator: (value) => AppValidators.nationalIdValidator(value, context),
            prefixIcon: Icon(FontAwesomeIcons.idCard, color: AppColors.iconColor),
            hintText: S.of(context).enter_your_national_id,
          ),
          AppPaddings.gap24.verticalSpace,
          GenderWidget(genderController: genderController),
          AppPaddings.gap32.verticalSpace,
          BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                ToastHelper.showSuccessToast(context, S.of(context).registration_successful);
                context.pop();
              } else if (state is RegisterFailure) {
                ToastHelper.showErrorToast(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is RegisterLoading) {
                return CustomButton(isLoading: true, text: "", onPressed: () {});
              }
              return CustomButton(
                text: S.of(context).register,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final String selectedGender =
                        genderController.text == S.of(context).male
                            ? "Male"
                            : genderController.text == S.of(context).female
                            ? "Female"
                            : "Male";
                    RegisterRequest registerRequest = RegisterRequest(
                      name: nameController.text,
                      email: emailController.text,
                      phoneNumber: phoneController.text,
                      password: passwordController.text,
                      nationalId: nationalIdController.text,
                      gender: selectedGender,
                    );
                    BlocProvider.of<RegisterCubit>(context).register(registerRequest);
                  } else {
                    setState(() {
                      _autovalidateMode = AutovalidateMode.onUserInteraction;
                    });
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
