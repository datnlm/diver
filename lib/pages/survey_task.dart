import 'package:diver/controller/garden_report_controller.dart';
import 'package:diver/controller/survey_controller.dart';
import 'package:diver/core/res/status.dart';
import 'package:diver/core/routes/routes.dart';
import 'package:diver/widgets/diver_team_card.dart';
import 'package:diver/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:diver/widgets/cell_card.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
        title: Text(
          "survey".tr,
          style: const TextStyle(
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
              gardenReportController
                  .getGardenReportById(Get.arguments['divingId']);
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
                  ? Center(child: Text('task-empty'.tr))
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('name'.tr),
                                      Text('Công viên Trí Nguyên',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ],
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Địa chỉ'.tr),
                                                Text('đảo Trí Nguyên',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Diện tích'.tr),
                                                Text('3977365893.72',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                          ),
                          shrinkWrap: true,
                          itemCount: controller.listCellSurvey.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return CellCard(
                                cell: controller.listCellSurvey[index]);
                          },
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
