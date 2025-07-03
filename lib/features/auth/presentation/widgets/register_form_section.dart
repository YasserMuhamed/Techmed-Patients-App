import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_paddings.dart';
import 'package:techmed/core/helpers/validators.dart';
import 'package:techmed/core/widgets/app_text_field.dart';
import 'package:techmed/core/widgets/custom_button.dart';
import 'package:techmed/generated/l10n.dart';

class RegisterFormSection extends StatefulWidget {
  const RegisterFormSection({super.key});

  @override
  State<RegisterFormSection> createState() => _RegisterFormSectionState();
}

class _RegisterFormSectionState extends State<RegisterFormSection> {
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
            keyboardType: TextInputType.name,
            validator: (value) => AppValidators.nameValidator(value, context),
            prefixIcon: Icon(Icons.person_outline, color: AppColors.iconColor),
            hintText: S.of(context).enter_your_name,
          ),
          AppPaddings.gap24.verticalSpace,
          AppTextField(
            keyboardType: TextInputType.emailAddress,
            validator: (value) => AppValidators.emailValidator(value, context),
            prefixIcon: Icon(Icons.email_outlined, color: AppColors.iconColor),
            hintText: S.of(context).enter_your_email,
          ),
          AppPaddings.gap24.verticalSpace,
          AppTextField(
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
          AppPaddings.gap24.verticalSpace,
          AppTextField(
            keyboardType: TextInputType.number,
            validator:
                (value) => AppValidators.nationalIdValidator(value, context),
            prefixIcon: Icon(
              FontAwesomeIcons.idCard,
              color: AppColors.iconColor,
            ),
            hintText: S.of(context).enter_your_national_id,
          ),
          AppPaddings.gap32.verticalSpace,
          CustomButton(
            text: S.of(context).register,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Registration logic here
              } else {
                setState(() {
                  _autovalidateMode = AutovalidateMode.onUserInteraction;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
