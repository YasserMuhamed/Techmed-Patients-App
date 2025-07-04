import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/core/widgets/app_text_field.dart';
import 'package:techmed/core/helpers/toast_helper.dart';
import 'package:techmed/core/helpers/validators.dart';
import 'package:techmed/core/widgets/back_icon_appbar.dart';
import 'package:techmed/core/widgets/custom_button.dart';
import 'package:techmed/features/Profile/data/models/update_user_request.dart';
import 'package:techmed/features/Profile/presentation/profile_cubit/profile_cubit.dart';
import 'package:techmed/features/auth/data/models/user_model/user_data.dart';
import 'package:techmed/generated/l10n.dart';

class UpdateUserInformationScreen extends StatelessWidget {
  const UpdateUserInformationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BackIconAppBar(title: S.of(context).update_info),
            Expanded(
              child: BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is ProfileFailure) {
                    ToastHelper.showErrorToast(context, state.error);
                  }
                },
                buildWhen: (previous, current) {
                  // Only rebuild when the state is ProfileSuccess or ProfileLoading
                  return current is ProfileSuccess || current is ProfileLoading || current is ProfileFailure;
                },
                builder: (context, state) {
                  if (state is ProfileLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ProfileSuccess && state.user.data != null) {
                    // Fill form with user data when profile is successfully loaded
                    // _fillFormWithUserData(state.user.data!);

                    return UpdateForm(userData: state.user.data!);
                  }

                  return const Center(child: Text('Failed to load profile data'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UpdateForm extends StatefulWidget {
  const UpdateForm({super.key, required this.userData});
  final UserData userData;
  @override
  State<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  // Text controllers
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _nationalIdController;
  late TextEditingController _emergencyContactNameController;
  late TextEditingController _emergencyContactPhoneController;
  late TextEditingController _allergiesController;
  late TextEditingController _ageController;
  late TextEditingController _genderController;
  late TextEditingController _maritalStatusController;
  late TextEditingController _dobController;

  String maritalStatus = '';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.userData.name ?? '');
    _emailController = TextEditingController(text: widget.userData.email ?? '');
    _phoneNumberController = TextEditingController(text: widget.userData.phoneNumber ?? '');
    _nationalIdController = TextEditingController(text: widget.userData.nationalId ?? '');
    _emergencyContactNameController = TextEditingController(text: widget.userData.emergencyContactName ?? '');
    _emergencyContactPhoneController = TextEditingController(text: widget.userData.emergencyContactPhone ?? '');
    _allergiesController = TextEditingController(text: widget.userData.allergies ?? '');
    _ageController = TextEditingController(text: widget.userData.age?.toString() ?? '');
    _genderController = TextEditingController(text: widget.userData.gender ?? '');
    _maritalStatusController = TextEditingController(text: widget.userData.maritalStatus ?? '');
    _dobController = TextEditingController(
      text:
          widget.userData.birthDate != null
              ? "${widget.userData.birthDate!.year}-${widget.userData.birthDate!.month.toString().padLeft(2, '0')}-${widget.userData.birthDate!.day.toString().padLeft(2, '0')}"
              : '',
    );
  }

  @override
  void dispose() {
    // Dispose all controllers
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _nationalIdController.dispose();
    _emergencyContactNameController.dispose();
    _emergencyContactPhoneController.dispose();
    _allergiesController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    _maritalStatusController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  void _updateUserProfile() {
    if (_formKey.currentState!.validate()) {
      String? backendMaritalStatus;
      if (_maritalStatusController.text.isNotEmpty) {
        // Map to convert localized values to backend expected format
        final Map<String, String> localizedToBackend = {
          S.of(context).single: 'Single',
          S.of(context).married: 'Married',
          S.of(context).divorced: 'Divorced',
          S.of(context).widowed: 'Widowed',
        };

        // Try direct mapping first
        backendMaritalStatus = localizedToBackend[_maritalStatusController.text];

        // If direct mapping fails, try case-insensitive matching
        if (backendMaritalStatus == null) {
          for (var entry in localizedToBackend.entries) {
            if (entry.key.toLowerCase() == _maritalStatusController.text.toLowerCase()) {
              backendMaritalStatus = entry.value;
              break;
            }
          }
        }

        // Fallback to direct value if no mapping found (in case it's already in correct format)
        if (backendMaritalStatus == null) {
          // Check if it's already a valid backend value
          final validBackendValues = ['Single', 'Married', 'Divorced', 'Widowed'];
          if (validBackendValues.contains(_maritalStatusController.text)) {
            backendMaritalStatus = _maritalStatusController.text;
          }
        }
        // Convert localized marital status to backend value
        UpdateUserRequest updateUserRequest = UpdateUserRequest(
          name: _nameController.text,
          phoneNumber: _phoneNumberController.text,
          emergencyContactName: _emergencyContactNameController.text,
          emergencyContactPhone: _emergencyContactPhoneController.text,
          allergies: _allergiesController.text,
          age: int.tryParse(_ageController.text),
          maritalStatus: backendMaritalStatus,
          birthDate: DateTime.tryParse(_dobController.text),
        );
        context.read<ProfileCubit>().updateUserData(updateUserRequest);
        print("Update User Request: ${updateUserRequest.toJson()}");
      } else {
        setState(() {
          _autovalidateMode = AutovalidateMode.onUserInteraction;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildUpdateForm(widget.userData);
  }

  Widget _buildUpdateForm(UserData userData) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: _autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                Text(S.of(context).update_your_info, style: AppTextStyles.poppins18SemiBold(context)),
                SizedBox(height: 12.h),
                _buildRequiredForm(userData),
                SizedBox(height: 12.h),
                _buildMaritalStatusDropdown(),
                SizedBox(height: 12.h),
                _buildBirthDateField(),
                SizedBox(height: 24.h),
                BlocConsumer<ProfileCubit, ProfileState>(
                  listenWhen: (previous, current) {
                    return current is UpdateUserDataSuccess || current is UpdateUserDataFailure;
                  },
                  listener: (context, state) {
                    if (state is UpdateUserDataSuccess) {
                      ToastHelper.showSuccessToast(context, S.of(context).profile_updated_successfully);
                      Navigator.pop(context, true); // Navigate back after successful update
                    } else if (state is UpdateUserDataFailure) {
                      ToastHelper.showErrorToast(context, state.error);
                    }
                  },
                  buildWhen: (previous, current) {
                    return current is UpdateUserDataLoading || current is UpdateUserDataSuccess || current is UpdateUserDataFailure;
                  },
                  builder: (context, state) {
                    if (state is UpdateUserDataLoading) {
                      return CustomButton(isLoading: true, text: "", onPressed: () {});
                    }
                    return CustomButton(text: S.of(context).update_profile, onPressed: _updateUserProfile);
                  },
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRequiredForm(UserData userData) {
    return Column(
      children: [
        AppTextField(
          hintText: S.of(context).enter_your_name,
          controller: _nameController,
          validator: (value) => AppValidators.nameValidator(value, context),
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(FontAwesomeIcons.signature, size: 22),
        ),
        SizedBox(height: 12.h),

        AppTextField(
          hintText: S.of(context).enter_your_email,
          controller: _emailController,
          enabled: false,
          validator: (value) => AppValidators.emailValidator(value, context),
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(FontAwesomeIcons.envelope, size: 22),
        ),
        SizedBox(height: 12.h),

        AppTextField(
          hintText: S.of(context).enter_your_phone,
          controller: _phoneNumberController,
          validator: (value) => AppValidators.phoneValidator(value, context),
          keyboardType: TextInputType.phone,
          prefixIcon: const Icon(FontAwesomeIcons.phone, size: 22),
        ),
        SizedBox(height: 12.h),

        AppTextField(
          enabled: false,
          hintText: S.of(context).enter_your_national_id,
          controller: _nationalIdController,
          validator: (value) => AppValidators.nationalIdValidator(value, context),
          keyboardType: TextInputType.number,
          prefixIcon: const Icon(FontAwesomeIcons.idCard, size: 22),
        ),
        SizedBox(height: 12.h),

        AppTextField(
          hintText: S.of(context).enter_emergency_contact_name,
          controller: _emergencyContactNameController,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(FontAwesomeIcons.notesMedical, size: 22),
        ),
        SizedBox(height: 12.h),

        AppTextField(
          hintText: S.of(context).enter_emergency_contact_number,
          controller: _emergencyContactPhoneController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return null; // Allow empty
            }
            return AppValidators.phoneValidator(value, context);
          },
          keyboardType: TextInputType.phone,
          prefixIcon: const Icon(FontAwesomeIcons.mobileRetro, size: 22),
        ),
        SizedBox(height: 12.h),

        AppTextField(
          hintText: S.of(context).enter_allergies,
          controller: _allergiesController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return null; // Allow empty
            }
            return AppValidators.allergiesValidator(value, context);
          },
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(FontAwesomeIcons.personDotsFromLine, size: 22),
        ),
        SizedBox(height: 12.h),

        AppTextField(
          hintText: S.of(context).enter_your_age,
          controller: _ageController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return null; // Allow empty
            }
            return AppValidators.ageValidator(value, context);
          },
          keyboardType: TextInputType.number,
          prefixIcon: const Icon(FontAwesomeIcons.user, size: 22),
        ),
        SizedBox(height: 12.h),

        // _buildGenderDropdown(),
      ],
    );
  }

  // Widget _buildGenderDropdown() {
  //   // Define gender options
  //   final List<String> genderOptions = [S.of(context).male, S.of(context).female];

  //   // Check if the current value matches any localized value
  //   String? currentValue;
  //   if (_genderController.text.isNotEmpty) {
  //     // Try to find a matching gender from our options
  //     for (final gender in genderOptions) {
  //       if (_genderController.text.toLowerCase() == gender.toLowerCase() ||
  //           (_genderController.text.toLowerCase() == 'male' && gender.toLowerCase() == S.of(context).male.toLowerCase()) ||
  //           (_genderController.text.toLowerCase() == 'female' && gender.toLowerCase() == S.of(context).female.toLowerCase())) {
  //         currentValue = gender;
  //         break;
  //       }
  //     }
  //   }

  //   return DropdownButtonFormField<String>(
  //     decoration: InputDecoration(
  //       labelText: S.of(context).gender,
  //       labelStyle: AppTextStyles.poppins14Regular(context).copyWith(color: AppColors.primaryText),
  //       prefixIcon: const Icon(Icons.people_outline, size: 26),
  //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
  //     ),
  //     value: currentValue,
  //     hint: Text(S.of(context).select_gender),
  //     validator: (value) => value == null || value.isEmpty ? 'Please select your gender' : null,
  //     items:
  //         genderOptions.map((String value) {
  //           return DropdownMenuItem<String>(value: value, child: Text(value, style: AppTextStyles.poppins14Medium(context)));
  //         }).toList(),
  //     onChanged: (String? newValue) {
  //       if (newValue != null) {
  //         setState(() {
  //           _genderController.text = newValue;
  //         });
  //       }
  //     },
  //   );
  // }

  Widget _buildMaritalStatusDropdown() {
    // Define marital status options
    final List<String> statusOptions = [S.of(context).single, S.of(context).married, S.of(context).divorced, S.of(context).widowed];

    // Map backend values to localized values for comparison
    final Map<String, String> backendToLocalized = {
      'single': S.of(context).single,
      'married': S.of(context).married,
      'divorced': S.of(context).divorced,
      'widowed': S.of(context).widowed,
    };

    String? currentValue;
    if (_maritalStatusController.text.isNotEmpty) {
      // Try to match backend value or localized value
      for (final entry in backendToLocalized.entries) {
        if (_maritalStatusController.text.toLowerCase() == entry.key.toLowerCase() ||
            _maritalStatusController.text.toLowerCase() == entry.value.toLowerCase()) {
          currentValue = entry.value;
          break;
        }
      }
    }

    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: S.of(context).marital_status,
        labelStyle: AppTextStyles.poppins14Regular(context).copyWith(color: AppColors.primaryText),
        prefixIcon: const Icon(Icons.family_restroom, size: 26),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      value: currentValue,
      hint: Text(S.of(context).select_marital_status, style: AppTextStyles.poppins14Medium(context)),
      items:
          statusOptions.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value, style: AppTextStyles.poppins14Medium(context)));
          }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _maritalStatusController.text = newValue;
            maritalStatus = newValue; // Update the local variable
          });
        }
      },
    );
  }

  Widget _buildBirthDateField() {
    return InkWell(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (pickedDate != null) {
          setState(() {
            _dobController.text =
                "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
          });
        }
      },
      child: AbsorbPointer(
        child: AppTextField(
          label: Text(S.of(context).birth_date),
          hintText: "YYYY-MM-DD",
          controller: _dobController,
          keyboardType: TextInputType.datetime,
          prefixIcon: const Icon(Icons.calendar_today, size: 26),
        ),
      ),
    );
  }
}
