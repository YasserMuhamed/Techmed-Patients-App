import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:techmed/configs/routing/app_routes.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/core/helpers/extensions.dart';
import 'package:techmed/features/appointment/presentation/manager/appointments/appointments_cubit.dart';
import 'package:techmed/features/appointment/presentation/widgets/appointment_card.dart';
import 'package:techmed/features/appointment/presentation/widgets/appointments_loading_cards.dart'
    show AppointmentLoadingCards;
import 'package:techmed/generated/l10n.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).appointments,
                style: AppTextStyles.poppins18Bold(context),
              ),
              26.verticalSpace,
              Expanded(
                child: BlocBuilder<AppointmentsCubit, AppointmentsState>(
                  buildWhen: (previous, current) {
                    return current is AppointmentsLoading ||
                        current is AppointmentsSuccess ||
                        current is AppointmentsFailure;
                  },
                  builder: (context, state) {
                    if (state is AppointmentsLoading) {
                      return const AppointmentLoadingCards();
                    } else if (state is AppointmentsSuccess) {
                      if (state.appointments.data == null ||
                          state.appointments.data!.isEmpty) {
                        return RefreshIndicator(
                          onRefresh:
                              () =>
                                  BlocProvider.of<AppointmentsCubit>(
                                    context,
                                  ).getAppointments(),
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                ),
                                Center(
                                  child: Text(
                                    S.of(context).no_appointments_found,
                                    style: AppTextStyles.poppins16Medium(
                                      context,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return RefreshIndicator(
                        onRefresh:
                            () =>
                                BlocProvider.of<AppointmentsCubit>(
                                  context,
                                ).getAppointments(),
                        child: ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: state.appointments.data!.length,
                          separatorBuilder:
                              (context, index) => 26.verticalSpace,
                          itemBuilder: (context, index) {
                            final appointment = state.appointments.data![index];
                            return AppointmentCard(
                              appointmentDate: DateFormat(
                                'yyyy-MM-dd',
                                "en-US",
                              ).format(appointment.date!),
                              appointmentTime: appointment.time!,
                              doctorName: appointment.doctor!.name!,
                              hospitalName: appointment.hospital!.name!,
                              onTap: () {
                                context
                                    .pushNamed(
                                      AppRoutes.kAppointmentDetailsScreen,
                                      arguments: appointment.id,
                                    )
                                    .then((value) {
                                      if (value == true) {
                                        BlocProvider.of<AppointmentsCubit>(
                                          context,
                                        ).getAppointments();
                                      }
                                    });
                              },
                            );
                          },
                        ),
                      );
                    } else if (state is AppointmentsFailure) {
                      return Center(
                        child: Text(
                          state.message,
                          style: AppTextStyles.poppins16Medium(context),
                        ),
                      );
                    }
                    return const AppointmentLoadingCards();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: TextButton.icon(
          onPressed: () {
            context.pushNamed(AppRoutes.kCreateAppointmentScreen).then((value) {
              if (value == true) {
                BlocProvider.of<AppointmentsCubit>(context).getAppointments();
              }
            });
          },
          icon: Icon(Icons.add, color: AppColors.white, size: 24.sp),
          label: Text(
            S.of(context).add_appointment,
            style: AppTextStyles.poppins16Bold(
              context,
            ).copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
