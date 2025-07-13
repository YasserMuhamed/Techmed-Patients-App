import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/features/Prescription/presentation/cubit/prescription_cubit.dart';

class PrescriptionFailureRefresh extends StatelessWidget {
  final String message;
  const PrescriptionFailureRefresh({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, style: AppTextStyles.poppins16Medium(context)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<PrescriptionCubit>(context).getPrescriptions();
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
