import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/features/vaccination/presentation/cubit/vaccination_cubit.dart';
import 'package:techmed/generated/l10n.dart';

class VaccinationFailureRefresh extends StatelessWidget {
  final String message;
  const VaccinationFailureRefresh({super.key, required this.message});

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
              BlocProvider.of<VaccinationCubit>(context).getVaccinations();
            },
            child: Text(S.of(context).retry),
          ),
        ],
      ),
    );
  }
}
