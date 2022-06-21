import 'package:diver/controller/dashboard_controller.dart';
import 'package:diver/controller/survey_controller.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../controller/login_controller.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => SurveyController());
  }
}
