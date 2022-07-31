import 'package:diver/controller/diver_team_controller.dart';
import 'package:diver/controller/information_controller.dart';
import 'package:get/get.dart';

class DashBoardController extends GetxController {
  var tabIndex = 0;
  final InformationController _informationController =
      Get.find<InformationController>();
  final DiverTeamController _diverTeamController =
      Get.find<DiverTeamController>();
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
    switch (index) {
      case 0:
        break;
      case 1:
        _diverTeamController.fetch();
        break;
      case 2:
        _informationController.fetch();
        break;

      default:
    }
  }
}
