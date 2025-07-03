import 'package:get_it/get_it.dart';
import 'package:techmed/Features/Main/presentation/manager/cubit/bottom_nav_cubit_cubit.dart';
import 'package:techmed/Features/Main/presentation/manager/cubit/home_cubit.dart';
import 'package:techmed/Features/Medication/presentation/manager/medication/medication_cubit.dart';
import 'package:techmed/core/api/api_manager.dart';
import 'package:techmed/core/api/dio_factory.dart';
import 'package:techmed/features/Medication/data/repository/medication_repo_impl.dart';
import 'package:techmed/features/Profile/data/repositories/profile_repository_implementation.dart';
import 'package:techmed/features/Profile/presentation/profile_cubit/profile_cubit.dart';
import 'package:techmed/features/auth/data/repositories/auth_repository_implementation.dart';
import 'package:techmed/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:techmed/features/auth/presentation/manager/register/register_cubit.dart';
import 'package:techmed/features/translation/cubit/localization_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio Client
  DioFactory.getDio();

  getIt.registerLazySingleton<ApiManager>(() => ApiManager(dio: DioFactory.getDio()));

  // Repositories
  getIt.registerLazySingleton<AuthRepositoryImplementation>(() => AuthRepositoryImplementation(apiManager: getIt<ApiManager>()));

  getIt.registerLazySingleton<MedicationRepositoryImplementation>(
    () => MedicationRepositoryImplementation(apiManager: getIt<ApiManager>()),
  );

  getIt.registerLazySingleton<ProfileRepositoryImplementation>(() => ProfileRepositoryImplementation(apiManager: getIt<ApiManager>()));

  // Cubits
  getIt.registerFactory<LocaleCubit>(() => LocaleCubit());
  getIt.registerFactory<BottomNavCubit>(() => BottomNavCubit());
  getIt.registerFactory<LoginCubit>(() => LoginCubit(authRepository: getIt<AuthRepositoryImplementation>()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(authRepository: getIt<AuthRepositoryImplementation>()));
  getIt.registerFactory<MedicationCubit>(() => MedicationCubit(getIt<MedicationRepositoryImplementation>()));

  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(authRepository: getIt<AuthRepositoryImplementation>(), profileRepository: getIt<ProfileRepositoryImplementation>()),
  );
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
}
