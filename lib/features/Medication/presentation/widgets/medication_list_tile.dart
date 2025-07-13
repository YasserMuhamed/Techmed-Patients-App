import 'package:flutter/material.dart';
import 'package:techmed/configs/routing/app_routes.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/core/constants/assets.dart';
import 'package:techmed/core/helpers/extensions.dart';
import 'package:techmed/core/widgets/svg_ic_container.dart';
import 'package:techmed/features/medication/presentation/manager/medication/medication_cubit.dart';
import 'package:techmed/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicationListTile extends StatelessWidget {
  final dynamic medication;
  const MedicationListTile({super.key, required this.medication});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Medication ID: ${medication.id}");
        context
            .pushNamed(
              AppRoutes.kMedicationDetailsScreen,
              arguments: medication.id,
            )
            .then((value) {
              if (value == true) {
                BlocProvider.of<MedicationCubit>(context).getMedications();
              }
            });
      },
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SvgICContainer(svgPath: Assets.assetsSvgsMedicine),
        title: Text(
          medication.medicine!.enName!,
          style: AppTextStyles.poppins16Medium(context),
        ),
        subtitle: Text(
          S.of(context).dosage_variable(medication.dosage!),
          style: AppTextStyles.poppins14Regular(
            context,
          ).copyWith(color: AppColors.secondaryText),
        ),
        trailing: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Text(
            textAlign: TextAlign.end,
            medication.notes!,
            style: AppTextStyles.poppins14Regular(
              context,
            ).copyWith(color: AppColors.primaryText),
          ),
        ),
      ),
    );
  }
}
