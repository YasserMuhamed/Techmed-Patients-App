// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(doctorName, hospitalName) =>
      "${doctorName} · ${hospitalName}";

  static String m1(id) => "Doctor ID: ${id}";

  static String m2(dosage) => "Dosage: ${dosage}";

  static String m3(value) => "Dosage: ${value}";

  static String m4(id) => "Hospital ID: ${id}";

  static String m5(count) => "${count} items";

  static String m6(id) => "Medicine ID: ${id}";

  static String m7(notes) => "Notes: ${notes}";

  static String m8(id) => "Prescription #${id}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "account": MessageLookupByLibrary.simpleMessage("Account"),
    "account_deleted": MessageLookupByLibrary.simpleMessage(
      "Account deleted successfully.",
    ),
    "add": MessageLookupByLibrary.simpleMessage("Add"),
    "add_appointment": MessageLookupByLibrary.simpleMessage("Add Appointment"),
    "add_medication": MessageLookupByLibrary.simpleMessage("Add Medication"),
    "add_vaccination": MessageLookupByLibrary.simpleMessage("Add Vaccination"),
    "age": MessageLookupByLibrary.simpleMessage("Age"),
    "allergies": MessageLookupByLibrary.simpleMessage("Allergies"),
    "already_have_an_account": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "app_description": MessageLookupByLibrary.simpleMessage(
      "Your personal health management app",
    ),
    "app_name": MessageLookupByLibrary.simpleMessage("TechMed"),
    "appointment_added_successfully": MessageLookupByLibrary.simpleMessage(
      "Appointment added successfully.",
    ),
    "appointment_canceled_successfully": MessageLookupByLibrary.simpleMessage(
      "Appointment canceled successfully.",
    ),
    "appointment_details": MessageLookupByLibrary.simpleMessage(
      "Appointment Details",
    ),
    "appointment_not_found": MessageLookupByLibrary.simpleMessage(
      "Appointment not found",
    ),
    "appointments": MessageLookupByLibrary.simpleMessage("Appointments"),
    "birth_date": MessageLookupByLibrary.simpleMessage("Birth Date"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cancel_appointment": MessageLookupByLibrary.simpleMessage(
      "Cancel Appointment",
    ),
    "cancel_appointment_confirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to cancel this appointment?",
    ),
    "change_language": MessageLookupByLibrary.simpleMessage("Change Language"),
    "change_password": MessageLookupByLibrary.simpleMessage("Change Password"),
    "change_password_error": MessageLookupByLibrary.simpleMessage(
      "Error changing password. Please try again.",
    ),
    "change_password_success": MessageLookupByLibrary.simpleMessage(
      "Your password has been changed successfully.",
    ),
    "confirm_cancel_appointment": MessageLookupByLibrary.simpleMessage(
      "Confirm Cancel Appointment",
    ),
    "confirm_delete": MessageLookupByLibrary.simpleMessage("Confirm Delete"),
    "confirm_new_password": MessageLookupByLibrary.simpleMessage(
      "Confirm New Password",
    ),
    "confirm_password": MessageLookupByLibrary.simpleMessage(
      "Confirm Password",
    ),
    "confirm_password_required": MessageLookupByLibrary.simpleMessage(
      "Confirm Password is required.",
    ),
    "create_account": MessageLookupByLibrary.simpleMessage(
      "Create your account",
    ),
    "current_password": MessageLookupByLibrary.simpleMessage(
      "Current Password",
    ),
    "date": MessageLookupByLibrary.simpleMessage("Date"),
    "date_required": MessageLookupByLibrary.simpleMessage("Date is required"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "delete_account": MessageLookupByLibrary.simpleMessage("Delete Account"),
    "delete_account_confirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete your account?",
    ),
    "delete_medication": MessageLookupByLibrary.simpleMessage(
      "Delete Medication",
    ),
    "delete_medication_confirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this medication?",
    ),
    "delete_vaccination": MessageLookupByLibrary.simpleMessage(
      "Delete Vaccination",
    ),
    "delete_vaccination_confirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this vaccination?",
    ),
    "divorced": MessageLookupByLibrary.simpleMessage("Divorced"),
    "doctor": MessageLookupByLibrary.simpleMessage("Doctor"),
    "doctor_and_hospital": m0,
    "doctor_id": m1,
    "doctor_information": MessageLookupByLibrary.simpleMessage(
      "Doctor Information",
    ),
    "doctor_name": MessageLookupByLibrary.simpleMessage("Doctor Name"),
    "doctor_required": MessageLookupByLibrary.simpleMessage(
      "Doctor is required",
    ),
    "dont_have_an_account": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account?",
    ),
    "dosage": MessageLookupByLibrary.simpleMessage("Dosage"),
    "dosage_hint": MessageLookupByLibrary.simpleMessage(
      "e.g., 500mg, 1 tablet",
    ),
    "dosage_info": m2,
    "dosage_required": MessageLookupByLibrary.simpleMessage(
      "Dosage is required",
    ),
    "dosage_variable": m3,
    "dr_title": MessageLookupByLibrary.simpleMessage("Dr."),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "email_required": MessageLookupByLibrary.simpleMessage(
      "Email is required.",
    ),
    "emergency_contact": MessageLookupByLibrary.simpleMessage(
      "Emergency Contact",
    ),
    "emergency_contact_name": MessageLookupByLibrary.simpleMessage(
      "Emergency Contact Name",
    ),
    "end_date": MessageLookupByLibrary.simpleMessage("End Date"),
    "end_date_required": MessageLookupByLibrary.simpleMessage(
      "End date is required",
    ),
    "enter_allergies": MessageLookupByLibrary.simpleMessage(
      "Enter allergies (if any)",
    ),
    "enter_confirm_new_password": MessageLookupByLibrary.simpleMessage(
      "Enter confirm new password",
    ),
    "enter_current_password": MessageLookupByLibrary.simpleMessage(
      "Enter current password",
    ),
    "enter_emergency_contact_name": MessageLookupByLibrary.simpleMessage(
      "Enter emergency contact name",
    ),
    "enter_emergency_contact_number": MessageLookupByLibrary.simpleMessage(
      "Enter emergency contact number",
    ),
    "enter_medication_name": MessageLookupByLibrary.simpleMessage(
      "Enter medication name",
    ),
    "enter_new_password": MessageLookupByLibrary.simpleMessage(
      "Enter new password",
    ),
    "enter_vaccination_name": MessageLookupByLibrary.simpleMessage(
      "Enter vaccination name",
    ),
    "enter_your_age": MessageLookupByLibrary.simpleMessage("Enter your age"),
    "enter_your_birth_date": MessageLookupByLibrary.simpleMessage(
      "Enter your birth date",
    ),
    "enter_your_email": MessageLookupByLibrary.simpleMessage(
      "Enter your email",
    ),
    "enter_your_name": MessageLookupByLibrary.simpleMessage("Enter your name"),
    "enter_your_national_id": MessageLookupByLibrary.simpleMessage(
      "Enter your national ID",
    ),
    "enter_your_otp_code": MessageLookupByLibrary.simpleMessage(
      "Enter the OTP code sent to your phone",
    ),
    "enter_your_password": MessageLookupByLibrary.simpleMessage(
      "Enter your password",
    ),
    "enter_your_phone": MessageLookupByLibrary.simpleMessage(
      "Enter your phone number",
    ),
    "enter_your_status": MessageLookupByLibrary.simpleMessage(
      "Enter your status",
    ),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "error_message": MessageLookupByLibrary.simpleMessage(
      "An error occurred. Please try again.",
    ),
    "female": MessageLookupByLibrary.simpleMessage("Female"),
    "forgot_password": MessageLookupByLibrary.simpleMessage("Forgot Password?"),
    "full_name": MessageLookupByLibrary.simpleMessage("Full Name"),
    "gender": MessageLookupByLibrary.simpleMessage("Gender"),
    "generic_error": MessageLookupByLibrary.simpleMessage(
      "Something went wrong. Please try again later.",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "hospital": MessageLookupByLibrary.simpleMessage("Hospital"),
    "hospital_id": m4,
    "hospital_information": MessageLookupByLibrary.simpleMessage(
      "Hospital Information",
    ),
    "hospital_name": MessageLookupByLibrary.simpleMessage("Hospital Name"),
    "hospital_required": MessageLookupByLibrary.simpleMessage(
      "Hospital is required",
    ),
    "invalid_age": MessageLookupByLibrary.simpleMessage(
      "Age must be a valid number",
    ),
    "invalid_email": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email address.",
    ),
    "invalid_national_id": MessageLookupByLibrary.simpleMessage(
      "Invalid national ID",
    ),
    "invalid_otp_code": MessageLookupByLibrary.simpleMessage(
      "Invalid OTP code",
    ),
    "invalid_phone": MessageLookupByLibrary.simpleMessage(
      "Invalid phone number",
    ),
    "items_count": m5,
    "loading_message": MessageLookupByLibrary.simpleMessage(
      "Loading, please wait...",
    ),
    "log_out": MessageLookupByLibrary.simpleMessage("Log Out"),
    "log_out_confirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to log out?",
    ),
    "log_out_success": MessageLookupByLibrary.simpleMessage(
      "You have been logged out successfully.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "login_to_your_account": MessageLookupByLibrary.simpleMessage(
      "Login to your account",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "male": MessageLookupByLibrary.simpleMessage("Male"),
    "marital_status": MessageLookupByLibrary.simpleMessage("Marital Status"),
    "married": MessageLookupByLibrary.simpleMessage("Married"),
    "medication": MessageLookupByLibrary.simpleMessage("Medication"),
    "medication_added_successfully": MessageLookupByLibrary.simpleMessage(
      "Medication added successfully.",
    ),
    "medication_deleted_successfully": MessageLookupByLibrary.simpleMessage(
      "Medication deleted successfully.",
    ),
    "medication_details": MessageLookupByLibrary.simpleMessage(
      "Medication Details",
    ),
    "medication_name": MessageLookupByLibrary.simpleMessage("Medication Name"),
    "medication_name_required": MessageLookupByLibrary.simpleMessage(
      "Medication name is required",
    ),
    "medications": MessageLookupByLibrary.simpleMessage("Medications"),
    "medicine": MessageLookupByLibrary.simpleMessage("Medicine"),
    "medicine_id": m6,
    "medicine_required": MessageLookupByLibrary.simpleMessage(
      "Medicine is required",
    ),
    "name_no_special_chars": MessageLookupByLibrary.simpleMessage(
      "Name should not contain special characters",
    ),
    "national_id": MessageLookupByLibrary.simpleMessage("National ID"),
    "network_error": MessageLookupByLibrary.simpleMessage(
      "Network error. Please check your internet connection.",
    ),
    "new_password": MessageLookupByLibrary.simpleMessage("New Password"),
    "no": MessageLookupByLibrary.simpleMessage("No"),
    "no_age_provided": MessageLookupByLibrary.simpleMessage("No age provided"),
    "no_allergies_provided": MessageLookupByLibrary.simpleMessage(
      "No allergies provided",
    ),
    "no_appointments_found": MessageLookupByLibrary.simpleMessage(
      "No appointments found",
    ),
    "no_birth_date_provided": MessageLookupByLibrary.simpleMessage(
      "No birth date provided",
    ),
    "no_date": MessageLookupByLibrary.simpleMessage("No date"),
    "no_doctors_available": MessageLookupByLibrary.simpleMessage(
      "No doctors available",
    ),
    "no_emergency_number_provided": MessageLookupByLibrary.simpleMessage(
      "No emergency number provided",
    ),
    "no_gender_provided": MessageLookupByLibrary.simpleMessage(
      "No gender provided",
    ),
    "no_hospitals_available": MessageLookupByLibrary.simpleMessage(
      "No hospitals available",
    ),
    "no_marital_status_provided": MessageLookupByLibrary.simpleMessage(
      "No marital status provided",
    ),
    "no_medications_found": MessageLookupByLibrary.simpleMessage(
      "No medications found",
    ),
    "no_medications_prescribed": MessageLookupByLibrary.simpleMessage(
      "No medications prescribed",
    ),
    "no_name_provided": MessageLookupByLibrary.simpleMessage(
      "No name provided",
    ),
    "no_notes_available": MessageLookupByLibrary.simpleMessage(
      "No notes available",
    ),
    "no_prescriptions_found": MessageLookupByLibrary.simpleMessage(
      "No prescriptions found",
    ),
    "no_profile_picture": MessageLookupByLibrary.simpleMessage(
      "No profile picture available",
    ),
    "no_vaccinations_found": MessageLookupByLibrary.simpleMessage(
      "No vaccinations found",
    ),
    "not_specified": MessageLookupByLibrary.simpleMessage("Not specified"),
    "note_hint": MessageLookupByLibrary.simpleMessage(
      "e.g., Take after meals, twice a day",
    ),
    "notes": MessageLookupByLibrary.simpleMessage("Notes"),
    "notes_info": m7,
    "notes_required": MessageLookupByLibrary.simpleMessage(
      "Notes are required",
    ),
    "otp_sent": MessageLookupByLibrary.simpleMessage(
      "OTP code sent to your phone",
    ),
    "otp_verification": MessageLookupByLibrary.simpleMessage(
      "OTP Verification",
    ),
    "otp_verification_description": MessageLookupByLibrary.simpleMessage(
      "Please enter the OTP code sent to your phone number to verify your account.",
    ),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "password_changed": MessageLookupByLibrary.simpleMessage(
      "Password changed successfully.",
    ),
    "password_length": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 6 characters",
    ),
    "password_mismatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match.",
    ),
    "password_required": MessageLookupByLibrary.simpleMessage(
      "Password is required.",
    ),
    "past": MessageLookupByLibrary.simpleMessage("Past"),
    "personal_info": MessageLookupByLibrary.simpleMessage(
      "Personal Information",
    ),
    "phone_number": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "phone_number_required": MessageLookupByLibrary.simpleMessage(
      "Phone number is required",
    ),
    "prescribed_medications": MessageLookupByLibrary.simpleMessage(
      "Prescribed Medications",
    ),
    "prescription_details": MessageLookupByLibrary.simpleMessage(
      "Prescription Details",
    ),
    "prescription_id": m8,
    "prescriptions": MessageLookupByLibrary.simpleMessage("Prescriptions"),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "profile_picture": MessageLookupByLibrary.simpleMessage("Profile Picture"),
    "profile_title": MessageLookupByLibrary.simpleMessage("Profile"),
    "profile_updated": MessageLookupByLibrary.simpleMessage(
      "Profile updated successfully.",
    ),
    "profile_updated_successfully": MessageLookupByLibrary.simpleMessage(
      "Profile updated successfully.",
    ),
    "register": MessageLookupByLibrary.simpleMessage("Register"),
    "register_message": MessageLookupByLibrary.simpleMessage(
      "Please fill in the details to create your account.",
    ),
    "registration_successful": MessageLookupByLibrary.simpleMessage(
      "Registration successful. Welcome!",
    ),
    "required": MessageLookupByLibrary.simpleMessage("Required"),
    "required_field": MessageLookupByLibrary.simpleMessage(
      "This field is required",
    ),
    "reset_password": MessageLookupByLibrary.simpleMessage("Reset Password"),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "retype_pass_required": MessageLookupByLibrary.simpleMessage(
      "Retype password is required",
    ),
    "retype_your_password": MessageLookupByLibrary.simpleMessage(
      "Retype your password",
    ),
    "save_changes": MessageLookupByLibrary.simpleMessage("Save Changes"),
    "schedule_doctor_visit": MessageLookupByLibrary.simpleMessage(
      "Schedule Doctor Visit",
    ),
    "select_appointment_date": MessageLookupByLibrary.simpleMessage(
      "Select Appointment Date",
    ),
    "select_appointment_time": MessageLookupByLibrary.simpleMessage(
      "Select Appointment Time",
    ),
    "select_doctor": MessageLookupByLibrary.simpleMessage("Select Doctor"),
    "select_end_date": MessageLookupByLibrary.simpleMessage("Select End Date"),
    "select_gender": MessageLookupByLibrary.simpleMessage("Select Gender"),
    "select_hospital": MessageLookupByLibrary.simpleMessage("Select Hospital"),
    "select_marital_status": MessageLookupByLibrary.simpleMessage(
      "Select Marital Status",
    ),
    "select_medicine": MessageLookupByLibrary.simpleMessage("Select Medicine"),
    "select_start_date": MessageLookupByLibrary.simpleMessage(
      "Select Start Date",
    ),
    "select_vaccination_date": MessageLookupByLibrary.simpleMessage(
      "Select vaccination date",
    ),
    "settings_title": MessageLookupByLibrary.simpleMessage("Settings"),
    "single": MessageLookupByLibrary.simpleMessage("Single"),
    "start_date": MessageLookupByLibrary.simpleMessage("Start Date"),
    "start_date_required": MessageLookupByLibrary.simpleMessage(
      "Start date is required",
    ),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "status_required": MessageLookupByLibrary.simpleMessage(
      "Status is required",
    ),
    "success": MessageLookupByLibrary.simpleMessage("Success"),
    "time": MessageLookupByLibrary.simpleMessage("Time"),
    "time_required": MessageLookupByLibrary.simpleMessage("Time is required"),
    "todays_medications": MessageLookupByLibrary.simpleMessage(
      "Today\'s Medications",
    ),
    "unknown_doctor": MessageLookupByLibrary.simpleMessage("Unknown Doctor"),
    "unknown_hospital": MessageLookupByLibrary.simpleMessage(
      "Unknown Hospital",
    ),
    "unknown_medicine": MessageLookupByLibrary.simpleMessage(
      "Unknown Medicine",
    ),
    "unknown_state": MessageLookupByLibrary.simpleMessage("Unknown state"),
    "up_coming": MessageLookupByLibrary.simpleMessage("Upcoming"),
    "update_info": MessageLookupByLibrary.simpleMessage("Update Information"),
    "update_profile": MessageLookupByLibrary.simpleMessage("Update Profile"),
    "update_your_info": MessageLookupByLibrary.simpleMessage(
      "Update Your Information",
    ),
    "upload_profile_picture": MessageLookupByLibrary.simpleMessage(
      "Upload Profile Picture",
    ),
    "vaccination_added_successfully": MessageLookupByLibrary.simpleMessage(
      "Vaccination added successfully.",
    ),
    "vaccination_date": MessageLookupByLibrary.simpleMessage(
      "Vaccination Date",
    ),
    "vaccination_date_required": MessageLookupByLibrary.simpleMessage(
      "Vaccination date is required",
    ),
    "vaccination_deleted_successfully": MessageLookupByLibrary.simpleMessage(
      "Vaccination deleted successfully.",
    ),
    "vaccination_details": MessageLookupByLibrary.simpleMessage(
      "Vaccination Details",
    ),
    "vaccination_name": MessageLookupByLibrary.simpleMessage(
      "Vaccination Name",
    ),
    "vaccination_name_required": MessageLookupByLibrary.simpleMessage(
      "Vaccination name is required",
    ),
    "vaccination_note_hint": MessageLookupByLibrary.simpleMessage(
      "e.g., Booster shot, annual flu vaccine",
    ),
    "vaccinations": MessageLookupByLibrary.simpleMessage("Vaccinations"),
    "verify_phone": MessageLookupByLibrary.simpleMessage("Verify phone number"),
    "view_and_manage_medications": MessageLookupByLibrary.simpleMessage(
      "View and Manage Medications",
    ),
    "view_and_manage_vaccinations": MessageLookupByLibrary.simpleMessage(
      "View and Manage Vaccinations",
    ),
    "weak_password": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 6 characters long.",
    ),
    "welcome_message": MessageLookupByLibrary.simpleMessage(
      "Welcome to TechMed",
    ),
    "widowed": MessageLookupByLibrary.simpleMessage("Widowed"),
    "yes": MessageLookupByLibrary.simpleMessage("Yes"),
  };
}
