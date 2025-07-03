import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techmed/core/di/dependency_injection.dart';
import 'package:techmed/core/observer/bloc_observer.dart';
import 'package:techmed/core/utils/functions/check_authorized_user.dart';
import 'package:techmed/techmed_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  await Future.wait<void>([
    ScreenUtil.ensureScreenSize(),
    setupGetIt(),
    dotenv.load(fileName: ".env"),
  ]);
  await checkIfUserLoggedIn();

  Bloc.observer = MyBlocObserver();
  runApp(const TechMedApp());
}
