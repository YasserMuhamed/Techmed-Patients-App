import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:techmed/configs/routing/app_routes.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/core/helpers/extensions.dart';

import 'package:techmed/features/vaccination/presentation/cubit/vaccination_cubit.dart';
import 'package:techmed/features/vaccination/presentation/widgets/vaccination_list_tile.dart';
import 'package:techmed/features/vaccination/presentation/widgets/vaccination_failure_refresh.dart';

import 'package:techmed/generated/l10n.dart';

class VaccinationScreen extends StatelessWidget {
  const VaccinationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).vaccinations, style: AppTextStyles.poppins18Bold(context)),
        centerTitle: true,
        leading: IconButton(icon: Icon(FontAwesomeIcons.xmark), onPressed: () => Navigator.of(context).pop()),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: BlocBuilder<VaccinationCubit, VaccinationState>(
                  buildWhen: (previous, current) {
                    return current is VaccinationLoading || current is VaccinationSuccess || current is VaccinationFailure;
                  },
                  builder: (context, state) {
                    if (state is VaccinationLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is VaccinationSuccess) {
                      if (state.vaccinations.data == null || state.vaccinations.data!.isEmpty) {
                        return Center(child: Text(S.of(context).no_vaccinations_found, style: AppTextStyles.poppins16Medium(context)));
                      }

                      return RefreshIndicator(
                        onRefresh: () => BlocProvider.of<VaccinationCubit>(context).getVaccinations(),
                        child: ListView.builder(
                          itemCount: state.vaccinations.data!.length,
                          itemBuilder: (context, index) {
                            final vaccination = state.vaccinations.data![index];
                            return VaccinationListTile(vaccination: vaccination);
                          },
                        ),
                      );
                    } else if (state is VaccinationFailure) {
                      return VaccinationFailureRefresh(message: state.message);
                    }

                    return Center(child: Text("unknown state", style: AppTextStyles.poppins16Medium(context)));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: DecoratedBox(
        decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(8.r)),
        child: TextButton.icon(
          onPressed: () {
            context.pushNamed(AppRoutes.kCreateVaccinationScreen).then((value) {
              if (value == true) {
                BlocProvider.of<VaccinationCubit>(context).getVaccinations();
              }
            });
          },
          icon: Icon(Icons.add, color: AppColors.white, size: 24.sp),
          label: Text(S.of(context).add_vaccination, style: AppTextStyles.poppins16Bold(context).copyWith(color: AppColors.white)),
        ),
      ),
    );
  }
}
