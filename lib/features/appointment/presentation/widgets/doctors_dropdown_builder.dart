import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/features/appointment/presentation/manager/doctors/doctors_cubit.dart';

import 'package:techmed/generated/l10n.dart';

class DoctorsDropdownBuilder extends StatelessWidget {
  final int? selectedDoctorId;
  final Function(int?) onChanged;

  const DoctorsDropdownBuilder({
    super.key,
    required this.selectedDoctorId,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsCubit, DoctorsState>(
      buildWhen: (previous, current) {
        return current is DoctorsLoading ||
            current is DoctorsSuccess ||
            current is DoctorsFailure;
      },
      builder: (context, state) {
        if (state is DoctorsLoading || state is DoctorsInitial) {
          return Center(child: CircularProgressIndicator());
        } else if (state is DoctorsFailure) {
          return Text(
            state.message,
            style: AppTextStyles.poppins14Regular(
              context,
            ).copyWith(color: Colors.red),
          );
        } else if (state is DoctorsSuccess) {
          if (state.doctors.data!.doctors!.isNotEmpty) {
            return DropdownButtonFormField<String>(
              value: selectedDoctorId?.toString(),
              onChanged: (value) {
                onChanged(int.tryParse(value!));
              },
              selectedItemBuilder: (context) {
                return state.doctors.data!.doctors!
                    .map(
                      (doctor) => Text(
                        doctor.name ?? '',
                        style: AppTextStyles.poppins14Medium(context),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                    .toList();
              },
              items:
                  state.doctors.data!.doctors!
                      .map(
                        (doctor) => DropdownMenuItem<String>(
                          value: doctor.id.toString(),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.userDoctor,
                                    color: AppColors.white,
                                    size: 22,
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          doctor.name ?? '',
                                          style: AppTextStyles.poppins14Medium(
                                            context,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        if ((doctor.jobTitle ?? '').isNotEmpty)
                                          Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons
                                                    .briefcaseMedical,
                                                color: AppColors.secondaryText,
                                                size: 16,
                                              ),
                                              SizedBox(width: 4.w),
                                              Expanded(
                                                child: Text(
                                                  doctor.jobTitle ?? '',
                                                  style:
                                                      AppTextStyles.poppins12Regular(
                                                        context,
                                                      ).copyWith(
                                                        color:
                                                            AppColors
                                                                .secondaryText,
                                                      ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        Divider(
                                          height: 8,
                                          thickness: 1,
                                          color: AppColors.cardBackground,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
              decoration: InputDecoration(
                labelText: S.of(context).select_doctor,
                labelStyle: AppTextStyles.poppins14Regular(
                  context,
                ).copyWith(color: AppColors.secondaryText),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.cardBackground),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.cardBackground),
                ),
              ),
            );
          }
          return Text(
            S.of(context).no_doctors_available,
            style: AppTextStyles.poppins14Regular(
              context,
            ).copyWith(color: AppColors.secondaryText),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
