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
        title: const Text("Cell Survey"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.save_alt,
              color: Colors.black87,
              size: 30,
            ),
            onPressed: () => _surveyController.uploadImage(cell),
          )
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
                        // return (controller.cellResponse.images!.isNotEmpty
                        //             ? controller.cellResponse.images!.length
                        //             : 0) >=
                        //         index
                        //     ? CellImageCardNetWord(imageIndex: index)
                        //     : CellImageCardFille(imageIndex: index);
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

//  MasonryGridView.count(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 15,
//                     crossAxisSpacing: 15,
//                     itemCount: 4,
//                     itemBuilder: (context, index) {
//                       return CellImageCard(imageIndex: index);
//                     },
//                   ),
