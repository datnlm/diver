import 'package:diver/controller/dashboard_controller.dart';
import 'package:diver/controller/garden_report_controller.dart';
import 'package:diver/controller/information_controller.dart';
import 'package:diver/controller/notification_controller.dart';
import 'package:diver/controller/survey_controller.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardController());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => SurveyController());
    Get.lazyPut(() => InformationController());
    Get.lazyPut(() => GardenReportController());
    Get.lazyPut(() => NotificationController());
  }
}
