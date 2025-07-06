import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/features/medication/presentation/manager/medication/medication_cubit.dart';

class MedicationFailureRefresh extends StatelessWidget {
  final String message;
  const MedicationFailureRefresh({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => BlocProvider.of<MedicationCubit>(context).getMedications(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(children: [Center(child: Text(message, style: AppTextStyles.poppins16Medium(context)))]),
      ),
    );
  }
}
