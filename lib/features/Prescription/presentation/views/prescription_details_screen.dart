import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';

import 'package:techmed/features/Prescription/data/models/prescription_details/data.dart';
import 'package:techmed/features/Prescription/presentation/cubit/prescription_cubit.dart';
import 'package:techmed/features/Prescription/presentation/widgets/prescription_details_loading.dart';
import 'package:techmed/generated/l10n.dart';

class PrescriptionDetailsScreen extends StatefulWidget {
  final int prescriptionId;
  const PrescriptionDetailsScreen({super.key, required this.prescriptionId});

  @override
  State<PrescriptionDetailsScreen> createState() => _PrescriptionDetailsScreenState();
}

class _PrescriptionDetailsScreenState extends State<PrescriptionDetailsScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch prescription details when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PrescriptionCubit>().getSinglePrescription(widget.prescriptionId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).prescription_details, style: AppTextStyles.poppins18Bold(context)),
        centerTitle: true,
        leading: IconButton(icon: Icon(FontAwesomeIcons.xmark), onPressed: () => Navigator.of(context).pop()),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: BlocBuilder<PrescriptionCubit, PrescriptionState>(
                    builder: (context, state) {
                      if (state is SinglePrescriptionLoading) {
                        return const PrescriptionDetailsLoadingWidget();
                      } else if (state is SinglePrescriptionSuccess) {
                        final prescription = state.prescription.data!;
                        return PrescriptionInfoSection(prescription: prescription);
                      } else if (state is SinglePrescriptionFailure) {
                        return Center(child: Text(state.error, style: AppTextStyles.poppins16Medium(context)));
                      }
                      return const PrescriptionDetailsLoadingWidget();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrescriptionInfoSection extends StatelessWidget {
  const PrescriptionInfoSection({super.key, required this.prescription});

  final Data prescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.verticalSpace,
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryColor.withOpacity(0.1), AppColors.darkBackground],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.primaryColor.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                    child: Icon(Icons.receipt_long, color: AppColors.primaryColor, size: 28),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(S.of(context).prescription_id(prescription.id.toString()), style: AppTextStyles.poppins18Bold(context)),
                        Text(
                          prescription.createdAt != null ? DateFormat.yMd().format(prescription.createdAt!) : S.of(context).no_date,
                          style: AppTextStyles.poppins14Regular(context).copyWith(color: AppColors.secondaryText),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        32.verticalSpace,
        Text(S.of(context).doctor_information, style: AppTextStyles.poppins18Bold(context)),
        16.verticalSpace,
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.darkBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primaryColor.withOpacity(0.2)),
          ),
          child: Row(
            children: [
              Icon(Icons.person, color: AppColors.primaryColor),
              16.horizontalSpace,
              Expanded(
                child: Text(
                  S.of(context).doctor_id(prescription.doctorId ?? S.of(context).unknown_doctor),
                  style: AppTextStyles.poppins16Medium(context),
                ),
              ),
            ],
          ),
        ),
        32.verticalSpace,
        Text(S.of(context).hospital_information, style: AppTextStyles.poppins18Bold(context)),
        16.verticalSpace,
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.darkBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primaryColor.withOpacity(0.2)),
          ),
          child: Row(
            children: [
              Icon(Icons.local_hospital, color: AppColors.primaryColor),
              16.horizontalSpace,
              Expanded(
                child: Text(
                  S.of(context).hospital_id(prescription.hospitalId ?? S.of(context).unknown_hospital),
                  style: AppTextStyles.poppins16Medium(context),
                ),
              ),
            ],
          ),
        ),
        32.verticalSpace,
        Text(S.of(context).prescribed_medications, style: AppTextStyles.poppins18Bold(context)),
        16.verticalSpace,
        if (prescription.items != null && prescription.items!.isNotEmpty)
          ...prescription.items!.map(
            (item) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.darkBackground,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primaryColor.withOpacity(0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.medication, color: AppColors.primaryColor, size: 20),
                      8.horizontalSpace,
                      Expanded(
                        child: Text(
                          S.of(context).medicine_id(item.medicineId ?? S.of(context).unknown_medicine),
                          style: AppTextStyles.poppins16Medium(context),
                        ),
                      ),
                    ],
                  ),
                  8.verticalSpace,
                  Text(
                    S.of(context).dosage_variable(item.dosage ?? S.of(context).not_specified),
                    style: AppTextStyles.poppins14Regular(context).copyWith(color: AppColors.secondaryText),
                  ),
                  if (item.notes != null && item.notes!.isNotEmpty) ...[
                    8.verticalSpace,
                    Text(
                      S.of(context).notes_info(item.notes!),
                      style: AppTextStyles.poppins14Regular(context).copyWith(color: AppColors.secondaryText),
                    ),
                  ],
                ],
              ),
            ),
          )
        else
          Text(
            S.of(context).no_medications_prescribed,
            style: AppTextStyles.poppins16Regular(context).copyWith(color: AppColors.secondaryText),
          ),
      ],
    );
  }
}
