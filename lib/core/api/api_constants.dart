class ApiConstants {
  static const loginEndPoint = "/auth/login";
  static const registerEndPoint = "/auth/register";
  static const userProfileEndPoint = "/auth/patient";
  static const updateUserProfileEndPoint = "/auth/patient";
  static const changePasswordEndPoint = "/auth/patient/change-password";
  static const getMedicationsEndPoint = "/medications";
  static String getSingleMedicationEndPoint(int id) => "/medications/$id";
  static const createMedicationEndPoint = "/medications";
  static String deleteMedicationEndPoint(int id) => "/medications/$id";

  static const getAppointmentsEndPoint = "/appointments";
  static String getSingleAppointmentEndPoint(int id) => "/appointments/$id";
  static const createAppointmentEndPoint = "/appointments";
  static String deleteAppointmentEndPoint(int id) => "/appointments/$id";

  static const getPrescriptionsEndPoint = "/prescriptions";
  static const getDoctorsEndPoint = "/data/doctors";
  static const getHospitalsEndPoint = "/data/hospitals";
  static const getAllMedicinesEndPoint = "/data/medicine";
}
