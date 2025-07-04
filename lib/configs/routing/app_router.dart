import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techmed/Features/Main/presentation/manager/cubit/bottom_nav_cubit_cubit.dart';
import 'package:techmed/configs/routing/app_routes.dart';
import 'package:techmed/core/di/dependency_injection.dart';
import 'package:techmed/features/Main/presentation/pages/main_screen.dart';
import 'package:techmed/features/Medication/presentation/manager/medication/medication_cubit.dart';
import 'package:techmed/features/Profile/presentation/pages/update_user_information_screen.dart';
import 'package:techmed/features/Profile/presentation/profile_cubit/profile_cubit.dart';
import 'package:techmed/features/Profile/presentation/pages/change_password_screen.dart';
import 'package:techmed/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:techmed/features/auth/presentation/manager/register/register_cubit.dart';
import 'package:techmed/features/auth/presentation/pages/login_screen.dart';
import 'package:techmed/features/auth/presentation/pages/register_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )

    switch (settings.name) {
      case AppRoutes.kLoginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreen(),
              ),
        );
      case AppRoutes.kRegisterScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<RegisterCubit>(),
                child: const RegisterScreen(),
              ),
        );
      case AppRoutes.kChangePasswordScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<ProfileCubit>(),
                child: const ChangePasswordScreen(),
              ),
        );
      case AppRoutes.kUpdateUserInfoScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<ProfileCubit>()..getUserProfile(),
                child: const UpdateUserInformationScreen(),
              ),
        );
      case AppRoutes.kMainScreen:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (context) => getIt<ProfileCubit>()..getUserProfile(),
                  ),
                  BlocProvider(
                    create:
                        (context) =>
                            getIt<MedicationCubit>()
                              ..getMedications()
                              ..getPrescriptions(),
                  ),
                  BlocProvider(create: (context) => getIt<BottomNavCubit>()),
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
