import 'package:techmed/core/helpers/constants.dart';
import 'package:techmed/configs/routing/app_routes.dart';

String routeHandler() {
  return hasTokenConstant ? AppRoutes.kMainScreen : AppRoutes.kLoginScreen;
}
