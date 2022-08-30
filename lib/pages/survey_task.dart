import 'package:diver/controller/garden_report_controller.dart';
import 'package:diver/controller/survey_controller.dart';
import 'package:diver/core/routes/routes.dart';
import 'package:diver/models/cell_survey.dart';
import 'package:diver/widgets/cell_card.dart';
import 'package:diver/widgets/garden_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SurveyScreenState createState() => _SurveyScreenState();
}

bool isSwitched = false;
SurveyController surveyController = Get.find<SurveyController>();

List<Tab> myTabs = <Tab>[
  Tab(text: 'myTask'.tr),
  Tab(text: 'viewAllTask'.tr),
];
late TabController _tabController;

class _SurveyScreenState extends State<SurveyScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    surveyController.tabTaskIndexNew = 0;
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
            onPressed: () {
              GardenReportController gardenReportController =
                  Get.find<GardenReportController>();
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
            child: Text('report'.tr,
                style: const TextStyle(
                  color: Colors.black,
                )),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        // color: kBackgroundColor,
        child: GetBuilder<SurveyController>(
          builder: (controller) => (controller.isLoadingAll.isTrue)
              ? const Center(child: CircularProgressIndicator())
              : controller.listCellSurvey.isEmpty
                  ? Center(child: Text('task-empty'.tr))
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: GardenCard(
                              garden:
                                  surveyController.listCellSurvey[0].garden!),
                        ),
                        Expanded(
                          child: DefaultTabController(
                              length: myTabs.length,
                              initialIndex: 0,
                              child: Builder(
                                builder: (BuildContext context) {
                                  final TabController tabController =
                                      DefaultTabController.of(context)!;
                                  tabController.addListener(() {
                                    if (!tabController.indexIsChanging) {
                                      // Your code goes here.
                                      // To get index of current tab use tabController.index
                                      surveyController.tabTaskIndexNew =
                                          tabController.index;
                                      surveyController.getSurveyById(
                                          Get.arguments['divingId'].toString());
                                    }
                                  });
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      SizedBox(
                                        child: TabBar(
                                          labelColor: Colors.black,
                                          unselectedLabelColor: Colors.grey,
                                          tabs: myTabs,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          children: myTabs.map((Tab tab) {
                                            return GetBuilder<SurveyController>(
                                              builder: (controller) => (controller
                                                      .isLoading.isTrue)
                                                  ? const Center(
                                                      child:
                                                          CircularProgressIndicator())
                                                  : controller.listSurvey
                                                              .isEmpty &&
                                                          controller
                                                              .isLoading.isFalse
                                                      ? _emptyTask()
                                                      : cellCard(controller),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              )),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }

  ListView cellCard(SurveyController controller) {
    return ListView.builder(
      itemCount: controller.listCellSurvey.length,
      itemBuilder: ((context, index) {
        return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 4.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: CellCard(
              cell: controller.listCellSurvey[index],
            ));
      }),
    );
  }

  Column _emptyTask() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 40,
        ),
        const Icon(
          Icons.assignment_outlined,
          size: 120.0,
        ),
        Text(
          'survey-empty'.tr,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        // Look like you have no task in this date.
        Text(
          'survey-emty-detail'.tr,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
