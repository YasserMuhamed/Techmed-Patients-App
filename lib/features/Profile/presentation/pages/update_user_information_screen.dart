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
import 'package:techmed/core/widgets/custom_button.dart';
import 'package:techmed/features/Profile/presentation/profile_cubit/profile_cubit.dart';
import 'package:techmed/features/auth/data/models/user_model/user_data.dart';

class UpdateUserInformationScreen extends StatefulWidget {
  const UpdateUserInformationScreen({super.key});

  @override
  State<UpdateUserInformationScreen> createState() => _UpdateUserInformationScreenState();
}

class _UpdateUserInformationScreenState extends State<UpdateUserInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  // Text controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _emergencyContactNameController = TextEditingController();
  final TextEditingController _emergencyContactPhoneController = TextEditingController();
  final TextEditingController _allergiesController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _maritalStatusController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch user profile when screen is initialized
    context.read<ProfileCubit>().getUserProfile();
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

  // Fill form controllers with user data
  void _fillFormWithUserData(UserData userData) {
    _nameController.text = userData.name ?? '';
    _emailController.text = userData.email ?? '';
    _phoneNumberController.text = userData.phoneNumber ?? '';
    _nationalIdController.text = userData.nationalId ?? '';
    _emergencyContactNameController.text = userData.emergencyContactName ?? '';
    _emergencyContactPhoneController.text = userData.emergencyContactPhone ?? '';
    _allergiesController.text = userData.allergies ?? '';
    _ageController.text = userData.age?.toString() ?? '';
    _genderController.text = userData.gender ?? '';
    _maritalStatusController.text = userData.maritalStatus ?? '';

    if (userData.birthDate != null) {
      _dobController.text = "${userData.birthDate!.year}-${userData.birthDate!.month}-${userData.birthDate!.day}";
    }
  }

  void _updateUserProfile() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement update profile functionality when available
      // This would typically call a method in your ProfileCubit
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile update functionality not implemented yet')));
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile', style: AppTextStyles.poppins18SemiBold(context).copyWith(color: AppColors.primaryText)),
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: AppColors.primaryText), onPressed: () => Navigator.of(context).pop()),
        backgroundColor: AppColors.darkBackground,
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileFailure) {
            ToastHelper.showErrorToast(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProfileSuccess && state.user.data != null) {
            // Fill form with user data when profile is successfully loaded
            _fillFormWithUserData(state.user.data!);

            return _buildUpdateForm();
          }

          return const Center(child: Text('Failed to load profile data'));
        },
      ),
    );
  }

  Widget _buildUpdateForm() {
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
                Text("Update Your Information", style: AppTextStyles.poppins18SemiBold(context)),
                SizedBox(height: 12.h),
                _buildRequiredForm(),
                SizedBox(height: 12.h),
                _buildMaritalStatusDropdown(),
                SizedBox(height: 12.h),
                _buildBirthDateField(),
                SizedBox(height: 24.h),
                CustomButton(text: "Update Profile", onPressed: _updateUserProfile),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRequiredForm() {
    return Column(
      children: [
        AppTextField(
          label: const Text("Full Name"),
          hintText: "Full Name",
          controller: _nameController,
          validator: (value) => AppValidators.nameValidator(value, context),
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(FontAwesomeIcons.signature, size: 22, color: AppColors.iconColor),
        ),
        SizedBox(height: 12.h),

        AppTextField(
          label: const Text("Email"),
          hintText: "Email",
          controller: _emailController,
          validator: (value) => AppValidators.emailValidator(value, context),
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(FontAwesomeIcons.envelope, size: 22),
        ),
        SizedBox(height: 12.h),

        AppTextField(
          label: const Text("Phone Number"),
          hintText: "Phone Number",
          controller: _phoneNumberController,
          validator: (value) => AppValidators.phoneValidator(value, context),
          keyboardType: TextInputType.phone,
          prefixIcon: const Icon(FontAwesomeIcons.phone, size: 22),
        ),
        SizedBox(height: 12.h),

        AppTextField(
          label: const Text("National ID"),
          hintText: "National ID",
          controller: _nationalIdController,
          validator: (value) => AppValidators.nationalIdValidator(value, context),
          keyboardType: TextInputType.number,
          prefixIcon: const Icon(FontAwesomeIcons.idCard, size: 22),
        ),
        SizedBox(height: 12.h),

        AppTextField(
          label: const Text("Emergency Contact Name"),
          hintText: "Emergency Contact Name",
          controller: _emergencyContactNameController,
          validator: (value) => AppValidators.nameValidator(value, context),
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(FontAwesomeIcons.notesMedical, size: 22),
        ),
        SizedBox(height: 12.h),

        AppTextField(
          label: const Text("Emergency Contact Phone"),
          hintText: "Emergency Contact Phone",
          controller: _emergencyContactPhoneController,
          validator: (value) => AppValidators.phoneValidator(value, context),
          keyboardType: TextInputType.phone,
          prefixIcon: const Icon(FontAwesomeIcons.mobileRetro, size: 22),
        ),
        SizedBox(height: 12.h),

        AppTextField(
          label: const Text("Allergies"),
          hintText: "Allergies",
          controller: _allergiesController,
          validator: (value) => AppValidators.allergiesValidator(value, context),
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(FontAwesomeIcons.personDotsFromLine, size: 22),
        ),
        SizedBox(height: 12.h),

        AppTextField(
          label: const Text("Age"),
          hintText: "Age",
          controller: _ageController,
          validator: (value) => AppValidators.ageValidator(value, context),
          keyboardType: TextInputType.number,
          prefixIcon: const Icon(FontAwesomeIcons.user, size: 22),
        ),
        SizedBox(height: 12.h),

        _buildGenderDropdown(),
      ],
    );
  }

  Widget _buildGenderDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Gender',
        prefixIcon: const Icon(Icons.people_outline, size: 26),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      value: _genderController.text.isNotEmpty ? _genderController.text : null,
      hint: const Text('Select Gender'),
      validator: (value) => value == null || value.isEmpty ? 'Please select your gender' : null,
      items:
          ['Male', 'Female'].map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _genderController.text = newValue;
          });
        }
      },
    );
  }

  Widget _buildMaritalStatusDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Marital Status',
        prefixIcon: const Icon(Icons.family_restroom, size: 26),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      value: _maritalStatusController.text.isNotEmpty ? _maritalStatusController.text : null,
      hint: const Text('Select Marital Status'),
      items:
          ['Single', 'Married', 'Divorced', 'Widowed'].map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _maritalStatusController.text = newValue;
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
            _dobController.text = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
          });
        }
      },
      child: AbsorbPointer(
        child: AppTextField(
          label: const Text("Date of Birth"),
          hintText: "YYYY-MM-DD",
          controller: _dobController,
          keyboardType: TextInputType.datetime,
          prefixIcon: const Icon(Icons.calendar_today, size: 26),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select your date of birth';
            }
            return null;
          },
        ),
      ),
    );
  }
}
