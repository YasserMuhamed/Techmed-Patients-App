import 'package:flutter/material.dart';
import 'package:techmed/core/helpers/constants.dart';
import 'package:techmed/core/helpers/extensions.dart';
import 'package:techmed/core/helpers/shared_pref_helper.dart';
import 'package:techmed/core/helpers/shared_prefs_keys.dart';

Future<void> checkIfUserLoggedIn() async {
  String hasTokenResult = await SharedPrefHelper.getSecuredString(
    SharedPrefsKeys.tokenKey,
  );
  debugPrint('hasTokenResult : $hasTokenResult');
  if (!hasTokenResult.isNullOrEmpty()) {
    hasTokenConstant = true;
  }
  // bool passedIntroCheckResult = await SharedPrefHelper.getBool(SharedPrefsKeys.hasPassedIntroKey);
  // debugPrint('passedIntroCheckResult : $passedIntroCheckResult');
  // if (passedIntroCheckResult) {
  //   hasPassedIntro = true;
  // }
}
