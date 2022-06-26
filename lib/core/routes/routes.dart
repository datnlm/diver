import 'package:diver/pages/cell_survey.dart';
import 'package:diver/pages/home.dart';
import 'package:diver/pages/information_diver.dart';
import 'package:diver/pages/login.dart';
import 'package:diver/pages/splash.dart';
import 'package:diver/pages/menu.dart';
import 'package:get/get.dart';
import 'package:diver/bindings/bindings.dart';

import '../../pages/dashboard.dart';
import '../../pages/survey_task.dart';
import '../../pages/information_form.dart';

class Routes {
  static const login = "/";
  static const splash = "/splash";
  static const dashboard = "/dashboard";
  static const home = "/home";
  static const menu = "/menu";
  static const information = "/information_diver";
  static const updateInformation = "/information_form";
  static const surveyTask = "/survey_task";
  static const cellPhoto = "/cell_image";
  static const cellSurvey = "/cell_survey";
}

class RouterGenerator {
  static final pages = [
    GetPage(
        name: Routes.login,
        page: () => const LoginScreen(),
        binding: Binding()),
    GetPage(
        name: Routes.splash,
        page: () => const SplashScreen(),
        binding: Binding()),
    GetPage(
        name: Routes.dashboard,
        page: () => const DashBoardScreen(),
        binding: Binding()),
    GetPage(
      name: Routes.menu,
      page: () => const MenuScreen(),
      binding: Binding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: Binding(),
    ),
    GetPage(
      name: Routes.information,
      page: () => const InformationDiverScreen(),
      binding: Binding(),
    ),
    GetPage(
      name: Routes.updateInformation,
      page: () => const UpdateInformationScreen(),
      binding: Binding(),
    ),
    GetPage(
      name: Routes.surveyTask,
      page: () => const SurveyScreen(),
      binding: Binding(),
    ),
    GetPage(
      name: Routes.cellSurvey,
      page: () => const CellSurveyScreen(),
      binding: Binding(),
    ),
  ];
}
