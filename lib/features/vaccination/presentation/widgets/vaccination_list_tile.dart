import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techmed/configs/routing/app_routes.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/core/helpers/extensions.dart';
import 'package:techmed/features/vaccination/presentation/cubit/vaccination_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VaccinationListTile extends StatelessWidget {
  final dynamic vaccination;
  const VaccinationListTile({super.key, required this.vaccination});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .pushNamed(
              AppRoutes.kVaccinationDetailsScreen,
              arguments: vaccination.id,
            )
            .then((value) {
              if (value == true) {
                BlocProvider.of<VaccinationCubit>(context).getVaccinations();
              }
            });
      },
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          width: 48,
          height: 48,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.dividerColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(FontAwesomeIcons.syringe, color: AppColors.white),
        ),
        title: Text(
          vaccination.vaccineName ?? 'Unknown Vaccination',
          style: AppTextStyles.poppins16Medium(context),
        ),
        subtitle: Text(
          vaccination.vaccineDate != null
              ? '${vaccination.vaccineDate!.day}/${vaccination.vaccineDate!.month}/${vaccination.vaccineDate!.year}'
              : 'No date specified',
          style: AppTextStyles.poppins14Regular(
            context,
          ).copyWith(color: AppColors.secondaryText),
        ),
        trailing: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Text(
            textAlign: TextAlign.end,
            vaccination.vaccineNotes ?? 'No notes',
            style: AppTextStyles.poppins14Regular(
              context,
            ).copyWith(color: AppColors.primaryText),
          ),
        ),
      ),
    );
  }
}
