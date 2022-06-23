import 'package:diver/controller/information_controller.dart';
import 'package:get/get.dart';

class DashBoardController extends GetxController {
  var tabIndex = 0;
  final InformationController _informationController =
      Get.find<InformationController>();
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
    switch (index) {
      case 0:
        break;
      case 1:
        _informationController.fetch();
        break;

      default:
    }
  }
}
