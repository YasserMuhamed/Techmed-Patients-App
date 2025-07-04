import 'package:techmed/generated/l10n.dart';

String translateGender(String? gender) {
  switch (gender) {
    case 'Male':
      return S.current.male;
    case 'Female':
      return S.current.female;
    default:
      return S.current.no_gender_provided;
  }
}
