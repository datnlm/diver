import 'package:diver/controller/survey_controller.dart';
import 'package:diver/models/cell_survey.dart';
import 'package:diver/widgets/cell_card_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CellImageScreen extends StatelessWidget {
  final Cell cell;

  const CellImageScreen({Key? key, required this.cell}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SurveyController _surveyController = Get.find<SurveyController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Cell Survey",
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
            onPressed: () => _surveyController.uploadImage(cell),
            child: const Text('Xong',
                style: TextStyle(
                  color: Colors.black,
                )),
          ),
        ],
      ),
      body: SafeArea(
        // color: kBackgroundColor,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: GetBuilder<SurveyController>(
              builder: (controller) => (controller.isLoading.isTrue)
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: (controller.cellResponse.images!.isNotEmpty
                              ? controller.cellResponse.images!.length
                              : 0) +
                          controller.listImage.length +
                          1,
                      itemBuilder: (BuildContext ctx, index) {
                        return CellImageCard(imageIndex: index);
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
