import 'package:diver/controller/garden_report_controller.dart';
import 'package:diver/controller/survey_controller.dart';
import 'package:diver/core/routes/routes.dart';
import 'package:diver/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:diver/widgets/cell_card.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SurveyScreenState createState() => _SurveyScreenState();
}

bool isSwitched = false;
SurveyController surveyController = Get.find<SurveyController>();
GardenReportController gardenReportController =
    Get.find<GardenReportController>();

class _SurveyScreenState extends State<SurveyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Khảo sát",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 18,
              ),
            ),
            onPressed: () {
              gardenReportController.getGardenReportById(Get.arguments['divingId']);
              Get.toNamed(
                Routes.gardenReport,
                arguments: {
                  "divingId": Get.arguments['divingId'],
                  "gardenId": Get.arguments['gardenId']
                },
              );
            },
            child: const Text('Report',
                style: TextStyle(
                  color: Colors.black,
                )),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        // color: kBackgroundColor,
        child: GetBuilder<SurveyController>(
          builder: (controller) => (controller.isLoading.isTrue)
              ? const Loading()
              : controller.listCellSurvey.isEmpty
                  ? const Center(child: Text('Ko co task'))
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                      ),
                      shrinkWrap: true,
                      itemCount: controller.listCellSurvey.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return CellCard(cell: controller.listCellSurvey[index]);
                      },
                    ),
        ),
      ),
    );
  }
}
