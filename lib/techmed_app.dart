import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techmed/core/utils/functions/route_handlers.dart';

import 'configs/routing/app_router.dart';
import 'core/di/dependency_injection.dart';
// import 'core/utils/functions/route_handlers.dart';
import 'features/translation/cubit/localization_cubit.dart';
import 'generated/l10n.dart';

class TechMedApp extends StatelessWidget {
  const TechMedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => getIt<LocaleCubit>())],
        child: BlocBuilder<LocaleCubit, Locale>(
          builder: (context, state) {
            return MaterialApp(
              locale: Locale(state.languageCode),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              title: 'TechMed',
              theme: ThemeData.dark(useMaterial3: true).copyWith(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF512DA8))),
              debugShowCheckedModeBanner: false,
              initialRoute: routeHandler(),
              onGenerateRoute: AppRouter.generateRoute,
            );
          },
        ),
      ),
    );
  }
}
