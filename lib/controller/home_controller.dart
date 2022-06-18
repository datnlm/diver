import 'package:diver/core/routes/routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Future<void> getAll() async {
    try {
      Get.toNamed(Routes.surveyList);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getAllOrder() async {
    try {
      Get.toNamed(Routes.orderList);
    } catch (e) {
      print(e);
    }
  }
}
