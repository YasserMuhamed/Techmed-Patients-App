import 'package:flutter/widgets.dart';
import 'package:techmed/core/helpers/app_regex.dart';
import 'package:techmed/generated/l10n.dart';

class AppValidators {
  static String? emailValidator(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return S.of(context).required;
    } else if (!AppRegex.isEmailValid(value)) {
      return S.of(context).invalid_email;
    }
    return null;
  }

  static String? nameValidator(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return S.of(context).required;
    } else if (AppRegex.hasSpecialCharacter(value)) {
      return S.of(context).name_no_special_chars;
    }
    return null;
  }

  static String? passwordValidator(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return S.of(context).required;
    } else if (value.length < 6) {
      return S.of(context).password_length;
    }
    return null;
  }

  static String? confirmPasswordValidator(
    String? value,
    String password,
    BuildContext context,
  ) {
    if (value!.isEmpty) {
      return S.of(context).required;
    } else if (value != password) {
      return S.of(context).password_mismatch;
    }
    return null;
  }

  static String? phoneValidator(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return S.of(context).required;
    } else if (!AppRegex.isPhoneNumberValid(value)) {
      return S.of(context).invalid_phone;
    }
    return null;
  }

  static String? nationalIdValidator(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return S.of(context).required;
    } else if (!AppRegex.isNationalId(value)) {
      return S.of(context).invalid_national_id;
    }
    return null;
  }

  static String? otpValidator(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return S.of(context).required;
    }
    return null;
  }

  static String? allergiesValidator(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).required;
    }
    return null;
  }

  static String? ageValidator(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).required;
    }
    final age = int.tryParse(value);
    if (age == null || age < 0) {
      return S.of(context).invalid_age;
    }
    return null;
  }
}
