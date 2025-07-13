import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';

import 'package:techmed/generated/l10n.dart';
import 'package:techmed/features/appointment/presentation/manager/appointments/appointments_cubit.dart';

class HospitalsDropdownBuilder extends StatelessWidget {
  final int? selectedHospitalId;
  final Function(int?) onChanged;

  const HospitalsDropdownBuilder({
    super.key,
    required this.selectedHospitalId,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentsCubit, AppointmentsState>(
      buildWhen: (previous, current) {
        return current is HospitalsLoading ||
            current is HospitalsSuccess ||
            current is HospitalsFailure;
      },
      builder: (context, state) {
        if (state is HospitalsLoading || state is AppointmentsInitial) {
          return Center(child: CircularProgressIndicator());
        } else if (state is HospitalsFailure) {
          return Text(
            state.message,
            style: AppTextStyles.poppins14Regular(
              context,
            ).copyWith(color: Colors.red),
          );
        } else if (state is HospitalsSuccess) {
          if (state.hospitals.data!.isNotEmpty) {
            return DropdownButtonFormField<String>(
              value: selectedHospitalId?.toString(),
              onChanged: (value) {
                onChanged(int.tryParse(value!));
              },
              selectedItemBuilder: (context) {
                return state.hospitals.data!
                    .map(
                      (hospital) => Text(
                        hospital.name ?? '',
                        style: AppTextStyles.poppins14Medium(context),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                    .toList();
              },
              items:
                  state.hospitals.data!
                      .map(
                        (hospital) => DropdownMenuItem<String>(
                          value: hospital.id.toString(),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.local_hospital,
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
                                          hospital.name ?? '',
                                          style: AppTextStyles.poppins14Medium(
                                            context,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        if ((hospital.location ?? '')
                                            .isNotEmpty)
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color: AppColors.secondaryText,
                                                size: 16,
                                              ),
                                              SizedBox(width: 4.w),
                                              Expanded(
                                                child: Text(
                                                  hospital.location ?? '',
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
