import 'package:diver/controller/survey_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:diver/widgets/cell_card.dart';
import 'package:diver/widgets/task_group.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({Key? key}) : super(key: key);

  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

final SurveyController _surveyController = Get.find<SurveyController>();

class _SurveyScreenState extends State<SurveyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Survey",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        // color: kBackgroundColor,
        child: GetBuilder<SurveyController>(
          builder: (controller) => (controller.isLoading.isTrue)
              ? const Center(child: CircularProgressIndicator())
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
