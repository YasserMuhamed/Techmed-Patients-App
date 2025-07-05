import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/core/di/dependency_injection.dart';
import 'package:techmed/core/helpers/toast_helper.dart';

import 'package:techmed/features/appointment/data/model/appointment_details_response/appointment.dart';
import 'package:techmed/features/appointment/presentation/manager/appointments/appointments_cubit.dart';
import 'package:techmed/features/appointment/presentation/widgets/appointment_card.dart';
import 'package:techmed/features/appointment/presentation/widgets/appointment_details_loading.dart';

import 'package:techmed/generated/l10n.dart';

class AppointmentDetailsScreen extends StatefulWidget {
  final int appointmentId;

  const AppointmentDetailsScreen({super.key, required this.appointmentId});

  @override
  State<AppointmentDetailsScreen> createState() =>
      _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppointmentsCubit>().getAppointmentDetails(
        widget.appointmentId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).appointment_details,
          style: AppTextStyles.poppins18Bold(context),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.xmark),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: BlocBuilder<AppointmentsCubit, AppointmentsState>(
            builder: (context, state) {
              if (state is AppointmentDetailsLoading) {
                return const AppointmentInfoSectionSkeleton();
              } else if (state is AppointmentDetailsSuccess) {
                final appointment = state.appointment.data!;
                return AppointmentInfoSection(appointment: appointment);
              } else if (state is AppointmentDetailsFailure) {
                return Center(
                  child: Text(
                    state.message,
                    style: AppTextStyles.poppins16Medium(context),
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ),
      floatingActionButton: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.error,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: TextButton.icon(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return BlocProvider(
                  create: (context) => getIt<AppointmentsCubit>(),

                  child: AlertDialog(
                    title: Text(
                      S.of(context).confirm_cancel_appointment,
                      style: AppTextStyles.poppins18Bold(context),
                    ),
                    content: Text(
                      S.of(context).cancel_appointment_confirmation,
                      style: AppTextStyles.poppins16Regular(context),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          S.of(context).cancel,
                          style: AppTextStyles.poppins16Medium(context),
                        ),
                      ),
                      BlocConsumer<AppointmentsCubit, AppointmentsState>(
                        listener: (context, state) {
                          if (state is AppointmentCancelSuccess) {
                            ToastHelper.showSuccessToast(
                              context,
                              S.of(context).appointment_canceled_successfully,
                            );
                            Navigator.of(context).pop(true);
                            Navigator.of(context).pop(true);
                          } else if (state is AppointmentCancelFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is AppointmentCancelLoading) {
                            return TextButton(
                              onPressed: () {},
                              child: Center(
                                child: const CircularProgressIndicator(),
                              ),
                            );
                          }
                          return TextButton(
                            onPressed: () {
                              context
                                  .read<AppointmentsCubit>()
                                  .cancelAppointment(widget.appointmentId);
                            },
                            child: Text(
                              S.of(context).cancel_appointment,
                              style: AppTextStyles.poppins16Medium(context),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          icon: Icon(FontAwesomeIcons.trash, color: AppColors.white, size: 24),
          label: Text(
            S.of(context).cancel_appointment,
            style: AppTextStyles.poppins16Bold(
              context,
            ).copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}

class AppointmentInfoSection extends StatelessWidget {
  const AppointmentInfoSection({super.key, required this.appointment});

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.verticalSpace,
        Text(
          S.of(context).appointment_details,
          style: AppTextStyles.poppins18Bold(context),
        ),
        20.verticalSpace,
        AppointmentCard(
          appointmentDate:
              appointment.date != null
                  ? DateFormat('yyyy-MM-dd', "en-US").format(appointment.date!)
                  : S.of(context).not_specified,
          appointmentTime:
              appointment.time != null
                  ? appointment.time!
                  : S.of(context).not_specified,
          doctorName: appointment.doctor?.name ?? S.of(context).not_specified,
          hospitalName:
              appointment.hospital?.name ?? S.of(context).not_specified,
        ),
        32.verticalSpace,
        Text(
          S.of(context).doctor_name,
          style: AppTextStyles.poppins18Bold(context),
        ),
        18.verticalSpace,
        Text(
          appointment.doctor?.name ?? S.of(context).not_specified,
          style: AppTextStyles.poppins16Regular(context),
        ),
        18.verticalSpace,
        Text(
          S.of(context).hospital_name,
          style: AppTextStyles.poppins18Bold(context),
        ),
        18.verticalSpace,
        Text(
          appointment.hospital?.name ?? S.of(context).not_specified,
          style: AppTextStyles.poppins16Regular(context),
        ),
        18.verticalSpace,

        Text(S.of(context).date, style: AppTextStyles.poppins18Bold(context)),
        18.verticalSpace,
        Text(
          appointment.date != null
              ? DateFormat.yMd().format(appointment.date!)
              : S.of(context).not_specified,
          style: AppTextStyles.poppins16Regular(context),
        ),
        18.verticalSpace,
        Text(S.of(context).time, style: AppTextStyles.poppins18Bold(context)),
        18.verticalSpace,
        Text(
          appointment.time ?? S.of(context).not_specified,
          style: AppTextStyles.poppins16Regular(context),
        ),
        18.verticalSpace,
        Text(S.of(context).status, style: AppTextStyles.poppins18Bold(context)),
        18.verticalSpace,
        Text(
          appointment.status ?? S.of(context).not_specified,
          style: AppTextStyles.poppins16Regular(context),
        ),
        18.verticalSpace,
      ],
    );
  }
}
