import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techmed/features/Prescription/presentation/cubit/prescription_cubit.dart';
import 'package:techmed/features/appointment/presentation/manager/appointments/appointments_cubit.dart';
import 'package:techmed/features/appointment/presentation/manager/doctors/doctors_cubit.dart';
import 'package:techmed/features/appointment/presentation/views/appointment_details_screen.dart';
import 'package:techmed/features/appointment/presentation/views/create_appointment_screen.dart';
import 'package:techmed/features/medication/presentation/manager/medication/medication_cubit.dart';
import 'package:techmed/features/vaccination/presentation/cubit/vaccination_cubit.dart';

import 'package:techmed/configs/routing/app_routes.dart';
import 'package:techmed/core/di/dependency_injection.dart';

import 'package:techmed/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:techmed/features/auth/presentation/manager/register/register_cubit.dart';
import 'package:techmed/features/auth/presentation/pages/login_screen.dart';
import 'package:techmed/features/auth/presentation/pages/register_screen.dart';

import 'package:techmed/features/main/presentation/manager/cubit/bottom_nav_cubit_cubit.dart';
import 'package:techmed/features/main/presentation/pages/main_screen.dart';
import 'package:techmed/features/Prescription/presentation/views/prescriptions_screen.dart';
import 'package:techmed/features/vaccination/presentation/views/vaccination_screen.dart';

import 'package:techmed/features/medication/presentation/views/create_medication_screen.dart';
import 'package:techmed/features/medication/presentation/views/medication_details_screen.dart';

import 'package:techmed/features/vaccination/presentation/views/create_vaccination_screen.dart';
import 'package:techmed/features/vaccination/presentation/views/vaccination_details_screen.dart';

import 'package:techmed/features/Prescription/presentation/views/prescription_details_screen.dart';

import 'package:techmed/features/profile/presentation/pages/change_password_screen.dart';
import 'package:techmed/features/profile/presentation/pages/update_user_information_screen.dart';
import 'package:techmed/features/profile/presentation/profile_cubit/profile_cubit.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )

    switch (settings.name) {
      case AppRoutes.kLoginScreen:
        return MaterialPageRoute(builder: (_) => BlocProvider(create: (context) => getIt<LoginCubit>(), child: const LoginScreen()));
      case AppRoutes.kRegisterScreen:
        return MaterialPageRoute(builder: (_) => BlocProvider(create: (context) => getIt<RegisterCubit>(), child: const RegisterScreen()));
      case AppRoutes.kChangePasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(create: (context) => getIt<ProfileCubit>(), child: const ChangePasswordScreen()),
        );
      case AppRoutes.kUpdateUserInfoScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(create: (context) => getIt<ProfileCubit>()..getUserProfile(), child: const UpdateUserInformationScreen()),
        );
      case AppRoutes.kPrescriptionsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(create: (context) => getIt<PrescriptionCubit>()..getPrescriptions(), child: PrescriptionsScreen()),
        );
      case AppRoutes.kPrescriptionDetailsScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) {
                  final cubit = getIt<PrescriptionCubit>();
                  cubit.getSinglePrescription(settings.arguments! as int);
                  return cubit;
                },
                child: PrescriptionDetailsScreen(prescriptionId: settings.arguments! as int),
              ),
        );
      case AppRoutes.kVaccinationsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(create: (context) => getIt<VaccinationCubit>()..getVaccinations(), child: VaccinationScreen()),
        );
      case AppRoutes.kCreateVaccinationScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(create: (context) => getIt<VaccinationCubit>(), child: CreateVaccinationScreen()),
        );
      case AppRoutes.kVaccinationDetailsScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) {
                  final cubit = getIt<VaccinationCubit>();
                  cubit.getVaccinationDetails(settings.arguments! as int);
                  return cubit;
                },
                child: VaccinationDetailsScreen(vaccinationId: settings.arguments! as int),
              ),
        );
      case AppRoutes.kCreateMedicationScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(create: (context) => getIt<MedicationCubit>()..getAllMedicines(), child: CreateMedicationScreen()),
        );
      case AppRoutes.kMedicationDetailsScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) {
                  final cubit = getIt<MedicationCubit>();
                  cubit.getMedicationDetails(settings.arguments! as int);
                  return cubit;
                },
                child: MedicationDetailsScreen(medicationId: settings.arguments! as int),
              ),
        );

      case AppRoutes.kAppointmentDetailsScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) {
                  final cubit = getIt<AppointmentsCubit>();
                  cubit.getAppointmentDetails(settings.arguments! as int);
                  return cubit;
                },
                child: AppointmentDetailsScreen(appointmentId: settings.arguments! as int),
              ),
        );
      case AppRoutes.kCreateAppointmentScreen:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => getIt<AppointmentsCubit>()..getAllHospitals()),
                  BlocProvider(create: (context) => getIt<DoctorsCubit>()..getAllDoctors()),
                ],
                child: CreateAppointmentScreen(),
              ),
        );
      case AppRoutes.kMainScreen:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => getIt<AppointmentsCubit>()..getAppointments()),
                  BlocProvider(create: (context) => getIt<ProfileCubit>()..getUserProfile()),
                  BlocProvider(create: (context) => getIt<BottomNavCubit>()),
                  BlocProvider(create: (context) => getIt<MedicationCubit>()..getMedications()),
                ],
                child: const MainScreen(),
              ),
        );

      // case Routes.homeScreen:
      //   return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
    return null;
  }
}
