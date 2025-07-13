// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `TechMed`
  String get app_name {
    return Intl.message('TechMed', name: 'app_name', desc: '', args: []);
  }

  /// `Welcome to TechMed`
  String get welcome_message {
    return Intl.message(
      'Welcome to TechMed',
      name: 'welcome_message',
      desc: '',
      args: [],
    );
  }

  /// `Your personal health management app`
  String get app_description {
    return Intl.message(
      'Your personal health management app',
      name: 'app_description',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `An error occurred. Please try again.`
  String get error_message {
    return Intl.message(
      'An error occurred. Please try again.',
      name: 'error_message',
      desc: '',
      args: [],
    );
  }

  /// `Loading, please wait...`
  String get loading_message {
    return Intl.message(
      'Loading, please wait...',
      name: 'loading_message',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings_title {
    return Intl.message('Settings', name: 'settings_title', desc: '', args: []);
  }

  /// `Profile`
  String get profile_title {
    return Intl.message('Profile', name: 'profile_title', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Enter your email`
  String get enter_your_email {
    return Intl.message(
      'Enter your email',
      name: 'enter_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get update_profile {
    return Intl.message(
      'Update Profile',
      name: 'update_profile',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get save_changes {
    return Intl.message(
      'Save Changes',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Delete Account`
  String get delete_account {
    return Intl.message(
      'Delete Account',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account?`
  String get delete_account_confirmation {
    return Intl.message(
      'Are you sure you want to delete your account?',
      name: 'delete_account_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Profile updated successfully.`
  String get profile_updated {
    return Intl.message(
      'Profile updated successfully.',
      name: 'profile_updated',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully.`
  String get password_changed {
    return Intl.message(
      'Password changed successfully.',
      name: 'password_changed',
      desc: '',
      args: [],
    );
  }

  /// `Account deleted successfully.`
  String get account_deleted {
    return Intl.message(
      'Account deleted successfully.',
      name: 'account_deleted',
      desc: '',
      args: [],
    );
  }

  /// `Email is required.`
  String get email_required {
    return Intl.message(
      'Email is required.',
      name: 'email_required',
      desc: '',
      args: [],
    );
  }

  /// `Password is required.`
  String get password_required {
    return Intl.message(
      'Password is required.',
      name: 'password_required',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password is required.`
  String get confirm_password_required {
    return Intl.message(
      'Confirm Password is required.',
      name: 'confirm_password_required',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match.`
  String get password_mismatch {
    return Intl.message(
      'Passwords do not match.',
      name: 'password_mismatch',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address.`
  String get invalid_email {
    return Intl.message(
      'Please enter a valid email address.',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters long.`
  String get weak_password {
    return Intl.message(
      'Password must be at least 6 characters long.',
      name: 'weak_password',
      desc: '',
      args: [],
    );
  }

  /// `Network error. Please check your internet connection.`
  String get network_error {
    return Intl.message(
      'Network error. Please check your internet connection.',
      name: 'network_error',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try again later.`
  String get generic_error {
    return Intl.message(
      'Something went wrong. Please try again later.',
      name: 'generic_error',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Required`
  String get required {
    return Intl.message('Required', name: 'required', desc: '', args: []);
  }

  /// `This field is required`
  String get required_field {
    return Intl.message(
      'This field is required',
      name: 'required_field',
      desc: '',
      args: [],
    );
  }

  /// `Name should not contain special characters`
  String get name_no_special_chars {
    return Intl.message(
      'Name should not contain special characters',
      name: 'name_no_special_chars',
      desc: '',
      args: [],
    );
  }

  /// `Retype password is required`
  String get retype_pass_required {
    return Intl.message(
      'Retype password is required',
      name: 'retype_pass_required',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get password_length {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'password_length',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get phone_number_required {
    return Intl.message(
      'Phone number is required',
      name: 'phone_number_required',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get invalid_phone {
    return Intl.message(
      'Invalid phone number',
      name: 'invalid_phone',
      desc: '',
      args: [],
    );
  }

  /// `Invalid OTP code`
  String get invalid_otp_code {
    return Intl.message(
      'Invalid OTP code',
      name: 'invalid_otp_code',
      desc: '',
      args: [],
    );
  }

  /// `Verify phone number`
  String get verify_phone {
    return Intl.message(
      'Verify phone number',
      name: 'verify_phone',
      desc: '',
      args: [],
    );
  }

  /// `Invalid national ID`
  String get invalid_national_id {
    return Intl.message(
      'Invalid national ID',
      name: 'invalid_national_id',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Enter your name`
  String get enter_your_name {
    return Intl.message(
      'Enter your name',
      name: 'enter_your_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enter_your_phone {
    return Intl.message(
      'Enter your phone number',
      name: 'enter_your_phone',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enter_your_password {
    return Intl.message(
      'Enter your password',
      name: 'enter_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Retype your password`
  String get retype_your_password {
    return Intl.message(
      'Retype your password',
      name: 'retype_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your national ID`
  String get enter_your_national_id {
    return Intl.message(
      'Enter your national ID',
      name: 'enter_your_national_id',
      desc: '',
      args: [],
    );
  }

  /// `Enter the OTP code sent to your phone`
  String get enter_your_otp_code {
    return Intl.message(
      'Enter the OTP code sent to your phone',
      name: 'enter_your_otp_code',
      desc: '',
      args: [],
    );
  }

  /// `OTP code sent to your phone`
  String get otp_sent {
    return Intl.message(
      'OTP code sent to your phone',
      name: 'otp_sent',
      desc: '',
      args: [],
    );
  }

  /// `OTP Verification`
  String get otp_verification {
    return Intl.message(
      'OTP Verification',
      name: 'otp_verification',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dont_have_an_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dont_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Create your account`
  String get create_account {
    return Intl.message(
      'Create your account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already_have_an_account {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account`
  String get login_to_your_account {
    return Intl.message(
      'Login to your account',
      name: 'login_to_your_account',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in the details to create your account.`
  String get register_message {
    return Intl.message(
      'Please fill in the details to create your account.',
      name: 'register_message',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the OTP code sent to your phone number to verify your account.`
  String get otp_verification_description {
    return Intl.message(
      'Please enter the OTP code sent to your phone number to verify your account.',
      name: 'otp_verification_description',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personal_info {
    return Intl.message(
      'Personal Information',
      name: 'personal_info',
      desc: '',
      args: [],
    );
  }

  /// `Profile Picture`
  String get profile_picture {
    return Intl.message(
      'Profile Picture',
      name: 'profile_picture',
      desc: '',
      args: [],
    );
  }

  /// `Upload Profile Picture`
  String get upload_profile_picture {
    return Intl.message(
      'Upload Profile Picture',
      name: 'upload_profile_picture',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `National ID`
  String get national_id {
    return Intl.message('National ID', name: 'national_id', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Emergency Contact`
  String get emergency_contact {
    return Intl.message(
      'Emergency Contact',
      name: 'emergency_contact',
      desc: '',
      args: [],
    );
  }

  /// `Emergency Contact Name`
  String get emergency_contact_name {
    return Intl.message(
      'Emergency Contact Name',
      name: 'emergency_contact_name',
      desc: '',
      args: [],
    );
  }

  /// `Allergies`
  String get allergies {
    return Intl.message('Allergies', name: 'allergies', desc: '', args: []);
  }

  /// `Age`
  String get age {
    return Intl.message('Age', name: 'age', desc: '', args: []);
  }

  /// `Birth Date`
  String get birth_date {
    return Intl.message('Birth Date', name: 'birth_date', desc: '', args: []);
  }

  /// `Marital Status`
  String get marital_status {
    return Intl.message(
      'Marital Status',
      name: 'marital_status',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Update Information`
  String get update_info {
    return Intl.message(
      'Update Information',
      name: 'update_info',
      desc: '',
      args: [],
    );
  }

  /// `No name provided`
  String get no_name_provided {
    return Intl.message(
      'No name provided',
      name: 'no_name_provided',
      desc: '',
      args: [],
    );
  }

  /// `No allergies provided`
  String get no_allergies_provided {
    return Intl.message(
      'No allergies provided',
      name: 'no_allergies_provided',
      desc: '',
      args: [],
    );
  }

  /// `No emergency number provided`
  String get no_emergency_number_provided {
    return Intl.message(
      'No emergency number provided',
      name: 'no_emergency_number_provided',
      desc: '',
      args: [],
    );
  }

  /// `No age provided`
  String get no_age_provided {
    return Intl.message(
      'No age provided',
      name: 'no_age_provided',
      desc: '',
      args: [],
    );
  }

  /// `No birth date provided`
  String get no_birth_date_provided {
    return Intl.message(
      'No birth date provided',
      name: 'no_birth_date_provided',
      desc: '',
      args: [],
    );
  }

  /// `No marital status provided`
  String get no_marital_status_provided {
    return Intl.message(
      'No marital status provided',
      name: 'no_marital_status_provided',
      desc: '',
      args: [],
    );
  }

  /// `No profile picture available`
  String get no_profile_picture {
    return Intl.message(
      'No profile picture available',
      name: 'no_profile_picture',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get log_out {
    return Intl.message('Log Out', name: 'log_out', desc: '', args: []);
  }

  /// `Are you sure you want to log out?`
  String get log_out_confirmation {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'log_out_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `You have been logged out successfully.`
  String get log_out_success {
    return Intl.message(
      'You have been logged out successfully.',
      name: 'log_out_success',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Prescriptions`
  String get prescriptions {
    return Intl.message(
      'Prescriptions',
      name: 'prescriptions',
      desc: '',
      args: [],
    );
  }

  /// `Appointments`
  String get appointments {
    return Intl.message(
      'Appointments',
      name: 'appointments',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get current_password {
    return Intl.message(
      'Current Password',
      name: 'current_password',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirm_new_password {
    return Intl.message(
      'Confirm New Password',
      name: 'confirm_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter current password`
  String get enter_current_password {
    return Intl.message(
      'Enter current password',
      name: 'enter_current_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter new password`
  String get enter_new_password {
    return Intl.message(
      'Enter new password',
      name: 'enter_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter confirm new password`
  String get enter_confirm_new_password {
    return Intl.message(
      'Enter confirm new password',
      name: 'enter_confirm_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been changed successfully.`
  String get change_password_success {
    return Intl.message(
      'Your password has been changed successfully.',
      name: 'change_password_success',
      desc: '',
      args: [],
    );
  }

  /// `Error changing password. Please try again.`
  String get change_password_error {
    return Intl.message(
      'Error changing password. Please try again.',
      name: 'change_password_error',
      desc: '',
      args: [],
    );
  }

  /// `Age must be a valid number`
  String get invalid_age {
    return Intl.message(
      'Age must be a valid number',
      name: 'invalid_age',
      desc: '',
      args: [],
    );
  }

  /// `Update Your Information`
  String get update_your_info {
    return Intl.message(
      'Update Your Information',
      name: 'update_your_info',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message('Full Name', name: 'full_name', desc: '', args: []);
  }

  /// `Enter emergency contact name`
  String get enter_emergency_contact_name {
    return Intl.message(
      'Enter emergency contact name',
      name: 'enter_emergency_contact_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter emergency contact number`
  String get enter_emergency_contact_number {
    return Intl.message(
      'Enter emergency contact number',
      name: 'enter_emergency_contact_number',
      desc: '',
      args: [],
    );
  }

  /// `Enter allergies (if any)`
  String get enter_allergies {
    return Intl.message(
      'Enter allergies (if any)',
      name: 'enter_allergies',
      desc: '',
      args: [],
    );
  }

  /// `Enter your age`
  String get enter_your_age {
    return Intl.message(
      'Enter your age',
      name: 'enter_your_age',
      desc: '',
      args: [],
    );
  }

  /// `Enter your birth date`
  String get enter_your_birth_date {
    return Intl.message(
      'Enter your birth date',
      name: 'enter_your_birth_date',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Select Marital Status`
  String get select_marital_status {
    return Intl.message(
      'Select Marital Status',
      name: 'select_marital_status',
      desc: '',
      args: [],
    );
  }

  /// `Married`
  String get married {
    return Intl.message('Married', name: 'married', desc: '', args: []);
  }

  /// `Single`
  String get single {
    return Intl.message('Single', name: 'single', desc: '', args: []);
  }

  /// `Divorced`
  String get divorced {
    return Intl.message('Divorced', name: 'divorced', desc: '', args: []);
  }

  /// `Widowed`
  String get widowed {
    return Intl.message('Widowed', name: 'widowed', desc: '', args: []);
  }

  /// `Select Gender`
  String get select_gender {
    return Intl.message(
      'Select Gender',
      name: 'select_gender',
      desc: '',
      args: [],
    );
  }

  /// `Profile updated successfully.`
  String get profile_updated_successfully {
    return Intl.message(
      'Profile updated successfully.',
      name: 'profile_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Registration successful. Welcome!`
  String get registration_successful {
    return Intl.message(
      'Registration successful. Welcome!',
      name: 'registration_successful',
      desc: '',
      args: [],
    );
  }

  /// `No gender provided`
  String get no_gender_provided {
    return Intl.message(
      'No gender provided',
      name: 'no_gender_provided',
      desc: '',
      args: [],
    );
  }

  /// `View and Manage Medications`
  String get view_and_manage_medications {
    return Intl.message(
      'View and Manage Medications',
      name: 'view_and_manage_medications',
      desc: '',
      args: [],
    );
  }

  /// `Medication Name`
  String get medication_name {
    return Intl.message(
      'Medication Name',
      name: 'medication_name',
      desc: '',
      args: [],
    );
  }

  /// `Schedule Doctor Visit`
  String get schedule_doctor_visit {
    return Intl.message(
      'Schedule Doctor Visit',
      name: 'schedule_doctor_visit',
      desc: '',
      args: [],
    );
  }

  /// `Doctor Name`
  String get doctor_name {
    return Intl.message('Doctor Name', name: 'doctor_name', desc: '', args: []);
  }

  /// `Today's Medications`
  String get todays_medications {
    return Intl.message(
      'Today\'s Medications',
      name: 'todays_medications',
      desc: '',
      args: [],
    );
  }

  /// `Prescription Details`
  String get prescription_details {
    return Intl.message(
      'Prescription Details',
      name: 'prescription_details',
      desc: '',
      args: [],
    );
  }

  /// `Medication`
  String get medication {
    return Intl.message('Medication', name: 'medication', desc: '', args: []);
  }

  /// `Vaccinations`
  String get vaccinations {
    return Intl.message(
      'Vaccinations',
      name: 'vaccinations',
      desc: '',
      args: [],
    );
  }

  /// `View and Manage Vaccinations`
  String get view_and_manage_vaccinations {
    return Intl.message(
      'View and Manage Vaccinations',
      name: 'view_and_manage_vaccinations',
      desc: '',
      args: [],
    );
  }

  /// `Vaccination Name`
  String get vaccination_name {
    return Intl.message(
      'Vaccination Name',
      name: 'vaccination_name',
      desc: '',
      args: [],
    );
  }

  /// `Vaccination Date`
  String get vaccination_date {
    return Intl.message(
      'Vaccination Date',
      name: 'vaccination_date',
      desc: '',
      args: [],
    );
  }

  /// `Vaccination Details`
  String get vaccination_details {
    return Intl.message(
      'Vaccination Details',
      name: 'vaccination_details',
      desc: '',
      args: [],
    );
  }

  /// `Dosage: {value}`
  String dosage_variable(Object value) {
    return Intl.message(
      'Dosage: $value',
      name: 'dosage_variable',
      desc: '',
      args: [value],
    );
  }

  /// `Medications`
  String get medications {
    return Intl.message('Medications', name: 'medications', desc: '', args: []);
  }

  /// `No medications found`
  String get no_medications_found {
    return Intl.message(
      'No medications found',
      name: 'no_medications_found',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `Add Medication`
  String get add_medication {
    return Intl.message(
      'Add Medication',
      name: 'add_medication',
      desc: '',
      args: [],
    );
  }

  /// `Add Vaccination`
  String get add_vaccination {
    return Intl.message(
      'Add Vaccination',
      name: 'add_vaccination',
      desc: '',
      args: [],
    );
  }

  /// `Medication added successfully.`
  String get medication_added_successfully {
    return Intl.message(
      'Medication added successfully.',
      name: 'medication_added_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Vaccination added successfully.`
  String get vaccination_added_successfully {
    return Intl.message(
      'Vaccination added successfully.',
      name: 'vaccination_added_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Dosage`
  String get dosage {
    return Intl.message('Dosage', name: 'dosage', desc: '', args: []);
  }

  /// `Dosage is required`
  String get dosage_required {
    return Intl.message(
      'Dosage is required',
      name: 'dosage_required',
      desc: '',
      args: [],
    );
  }

  /// `Medication name is required`
  String get medication_name_required {
    return Intl.message(
      'Medication name is required',
      name: 'medication_name_required',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get start_date {
    return Intl.message('Start Date', name: 'start_date', desc: '', args: []);
  }

  /// `End Date`
  String get end_date {
    return Intl.message('End Date', name: 'end_date', desc: '', args: []);
  }

  /// `Start date is required`
  String get start_date_required {
    return Intl.message(
      'Start date is required',
      name: 'start_date_required',
      desc: '',
      args: [],
    );
  }

  /// `End date is required`
  String get end_date_required {
    return Intl.message(
      'End date is required',
      name: 'end_date_required',
      desc: '',
      args: [],
    );
  }

  /// `Select Start Date`
  String get select_start_date {
    return Intl.message(
      'Select Start Date',
      name: 'select_start_date',
      desc: '',
      args: [],
    );
  }

  /// `Select End Date`
  String get select_end_date {
    return Intl.message(
      'Select End Date',
      name: 'select_end_date',
      desc: '',
      args: [],
    );
  }

  /// `Select Medicine`
  String get select_medicine {
    return Intl.message(
      'Select Medicine',
      name: 'select_medicine',
      desc: '',
      args: [],
    );
  }

  /// `Medicine is required`
  String get medicine_required {
    return Intl.message(
      'Medicine is required',
      name: 'medicine_required',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message('Notes', name: 'notes', desc: '', args: []);
  }

  /// `Notes are required`
  String get notes_required {
    return Intl.message(
      'Notes are required',
      name: 'notes_required',
      desc: '',
      args: [],
    );
  }

  /// `Enter medication name`
  String get enter_medication_name {
    return Intl.message(
      'Enter medication name',
      name: 'enter_medication_name',
      desc: '',
      args: [],
    );
  }

  /// `e.g., 500mg, 1 tablet`
  String get dosage_hint {
    return Intl.message(
      'e.g., 500mg, 1 tablet',
      name: 'dosage_hint',
      desc: '',
      args: [],
    );
  }

  /// `e.g., Take after meals, twice a day`
  String get note_hint {
    return Intl.message(
      'e.g., Take after meals, twice a day',
      name: 'note_hint',
      desc: '',
      args: [],
    );
  }

  /// `Medicine`
  String get medicine {
    return Intl.message('Medicine', name: 'medicine', desc: '', args: []);
  }

  /// `Medication Details`
  String get medication_details {
    return Intl.message(
      'Medication Details',
      name: 'medication_details',
      desc: '',
      args: [],
    );
  }

  /// `No notes available`
  String get no_notes_available {
    return Intl.message(
      'No notes available',
      name: 'no_notes_available',
      desc: '',
      args: [],
    );
  }

  /// `Delete Medication`
  String get delete_medication {
    return Intl.message(
      'Delete Medication',
      name: 'delete_medication',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Delete`
  String get confirm_delete {
    return Intl.message(
      'Confirm Delete',
      name: 'confirm_delete',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this medication?`
  String get delete_medication_confirmation {
    return Intl.message(
      'Are you sure you want to delete this medication?',
      name: 'delete_medication_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Medication deleted successfully.`
  String get medication_deleted_successfully {
    return Intl.message(
      'Medication deleted successfully.',
      name: 'medication_deleted_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get up_coming {
    return Intl.message('Upcoming', name: 'up_coming', desc: '', args: []);
  }

  /// `Past`
  String get past {
    return Intl.message('Past', name: 'past', desc: '', args: []);
  }

  /// `{doctorName} · {hospitalName}`
  String doctor_and_hospital(Object doctorName, Object hospitalName) {
    return Intl.message(
      '$doctorName · $hospitalName',
      name: 'doctor_and_hospital',
      desc: '',
      args: [doctorName, hospitalName],
    );
  }

  /// `No appointments found`
  String get no_appointments_found {
    return Intl.message(
      'No appointments found',
      name: 'no_appointments_found',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Appointment`
  String get cancel_appointment {
    return Intl.message(
      'Cancel Appointment',
      name: 'cancel_appointment',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Cancel Appointment`
  String get confirm_cancel_appointment {
    return Intl.message(
      'Confirm Cancel Appointment',
      name: 'confirm_cancel_appointment',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel this appointment?`
  String get cancel_appointment_confirmation {
    return Intl.message(
      'Are you sure you want to cancel this appointment?',
      name: 'cancel_appointment_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Appointment canceled successfully.`
  String get appointment_canceled_successfully {
    return Intl.message(
      'Appointment canceled successfully.',
      name: 'appointment_canceled_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Details`
  String get appointment_details {
    return Intl.message(
      'Appointment Details',
      name: 'appointment_details',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message('Time', name: 'time', desc: '', args: []);
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `Hospital Name`
  String get hospital_name {
    return Intl.message(
      'Hospital Name',
      name: 'hospital_name',
      desc: '',
      args: [],
    );
  }

  /// `Not specified`
  String get not_specified {
    return Intl.message(
      'Not specified',
      name: 'not_specified',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Hospital`
  String get unknown_hospital {
    return Intl.message(
      'Unknown Hospital',
      name: 'unknown_hospital',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Doctor`
  String get unknown_doctor {
    return Intl.message(
      'Unknown Doctor',
      name: 'unknown_doctor',
      desc: '',
      args: [],
    );
  }

  /// `Appointment not found`
  String get appointment_not_found {
    return Intl.message(
      'Appointment not found',
      name: 'appointment_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Add Appointment`
  String get add_appointment {
    return Intl.message(
      'Add Appointment',
      name: 'add_appointment',
      desc: '',
      args: [],
    );
  }

  /// `Appointment added successfully.`
  String get appointment_added_successfully {
    return Intl.message(
      'Appointment added successfully.',
      name: 'appointment_added_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Date is required`
  String get date_required {
    return Intl.message(
      'Date is required',
      name: 'date_required',
      desc: '',
      args: [],
    );
  }

  /// `Time is required`
  String get time_required {
    return Intl.message(
      'Time is required',
      name: 'time_required',
      desc: '',
      args: [],
    );
  }

  /// `Status is required`
  String get status_required {
    return Intl.message(
      'Status is required',
      name: 'status_required',
      desc: '',
      args: [],
    );
  }

  /// `Doctor is required`
  String get doctor_required {
    return Intl.message(
      'Doctor is required',
      name: 'doctor_required',
      desc: '',
      args: [],
    );
  }

  /// `Hospital is required`
  String get hospital_required {
    return Intl.message(
      'Hospital is required',
      name: 'hospital_required',
      desc: '',
      args: [],
    );
  }

  /// `Select Doctor`
  String get select_doctor {
    return Intl.message(
      'Select Doctor',
      name: 'select_doctor',
      desc: '',
      args: [],
    );
  }

  /// `Select Hospital`
  String get select_hospital {
    return Intl.message(
      'Select Hospital',
      name: 'select_hospital',
      desc: '',
      args: [],
    );
  }

  /// `No doctors available`
  String get no_doctors_available {
    return Intl.message(
      'No doctors available',
      name: 'no_doctors_available',
      desc: '',
      args: [],
    );
  }

  /// `No hospitals available`
  String get no_hospitals_available {
    return Intl.message(
      'No hospitals available',
      name: 'no_hospitals_available',
      desc: '',
      args: [],
    );
  }

  /// `Select Appointment Date`
  String get select_appointment_date {
    return Intl.message(
      'Select Appointment Date',
      name: 'select_appointment_date',
      desc: '',
      args: [],
    );
  }

  /// `Select Appointment Time`
  String get select_appointment_time {
    return Intl.message(
      'Select Appointment Time',
      name: 'select_appointment_time',
      desc: '',
      args: [],
    );
  }

  /// `Hospital`
  String get hospital {
    return Intl.message('Hospital', name: 'hospital', desc: '', args: []);
  }

  /// `Doctor`
  String get doctor {
    return Intl.message('Doctor', name: 'doctor', desc: '', args: []);
  }

  /// `Enter your status`
  String get enter_your_status {
    return Intl.message(
      'Enter your status',
      name: 'enter_your_status',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `No vaccinations found`
  String get no_vaccinations_found {
    return Intl.message(
      'No vaccinations found',
      name: 'no_vaccinations_found',
      desc: '',
      args: [],
    );
  }

  /// `Delete Vaccination`
  String get delete_vaccination {
    return Intl.message(
      'Delete Vaccination',
      name: 'delete_vaccination',
      desc: '',
      args: [],
    );
  }

  /// `Vaccination deleted successfully.`
  String get vaccination_deleted_successfully {
    return Intl.message(
      'Vaccination deleted successfully.',
      name: 'vaccination_deleted_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this vaccination?`
  String get delete_vaccination_confirmation {
    return Intl.message(
      'Are you sure you want to delete this vaccination?',
      name: 'delete_vaccination_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Enter vaccination name`
  String get enter_vaccination_name {
    return Intl.message(
      'Enter vaccination name',
      name: 'enter_vaccination_name',
      desc: '',
      args: [],
    );
  }

  /// `Select vaccination date`
  String get select_vaccination_date {
    return Intl.message(
      'Select vaccination date',
      name: 'select_vaccination_date',
      desc: '',
      args: [],
    );
  }

  /// `Vaccination name is required`
  String get vaccination_name_required {
    return Intl.message(
      'Vaccination name is required',
      name: 'vaccination_name_required',
      desc: '',
      args: [],
    );
  }

  /// `Vaccination date is required`
  String get vaccination_date_required {
    return Intl.message(
      'Vaccination date is required',
      name: 'vaccination_date_required',
      desc: '',
      args: [],
    );
  }

  /// `e.g., Booster shot, annual flu vaccine`
  String get vaccination_note_hint {
    return Intl.message(
      'e.g., Booster shot, annual flu vaccine',
      name: 'vaccination_note_hint',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
