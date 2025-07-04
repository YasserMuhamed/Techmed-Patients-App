enum Gender { male, female }

Gender genderFromString(String gender) {
  switch (gender) {
    case "Male":
      return Gender.male;
    case "Female":
      return Gender.female;
    default:
      return Gender.male;
  }
}

String genderToString(Gender gender) {
  switch (gender) {
    case Gender.male:
      return "Male";
    case Gender.female:
      return "Female";
  }
}

enum MaritalStatus { single, married, divorced, widowed }

MaritalStatus maritalStatusFromString(String status) {
  switch (status) {
    case "Single":
      return MaritalStatus.single;
    case "Married":
      return MaritalStatus.married;
    case "Divorced":
      return MaritalStatus.divorced;
    case "Widowed":
      return MaritalStatus.widowed;
    default:
      return MaritalStatus.single;
  }
}

String maritalStatusToString(MaritalStatus status) {
  switch (status) {
    case MaritalStatus.single:
      return "Single";
    case MaritalStatus.married:
      return "Married";
    case MaritalStatus.divorced:
      return "Divorced";
    case MaritalStatus.widowed:
      return "Widowed";
  }
}
