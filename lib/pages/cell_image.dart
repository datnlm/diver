import 'package:diver/controller/survey_controller.dart';
import 'package:diver/models/cell_survey.dart';
import 'package:diver/widgets/cell_card_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:diver/widgets/cell_card.dart';
import 'package:diver/widgets/task_group.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';

class CellImageScreen extends StatelessWidget {
  final Cell cell;

  const CellImageScreen({Key? key, required this.cell}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SurveyController _surveyController = Get.find<SurveyController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Survey"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.save_alt,
              color: Colors.black,
            ),
            onPressed: () => _surveyController.uploadImage(cell),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        // color: kBackgroundColor,
        child: GetBuilder<SurveyController>(
          builder: (controller) => (controller.isLoading.isTrue)
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: controller.listImage.length + 1,
                  itemBuilder: (BuildContext ctx, index) {
                    return CellImageCard(imageIndex: index);
                  },
                ),
        ),
      ),
    );
  }
}
