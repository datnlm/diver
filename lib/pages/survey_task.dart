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
        title: const Text("Survey"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
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
      // body: Container(
      //   padding: const EdgeInsets.all(16),
      //   // color: kBackgroundColor,
      //   child: GetBuilder<SurveyController>(
      //     builder: (controller) => (controller.isLoading.isTrue)
      //         ? const Center(child: CircularProgressIndicator())
      //         : controller.listCellSurvey.isEmpty
      //             ? const Center(child: Text('Ko co task'))
      //             : GridView.builder(
      //                 gridDelegate:
      //                     const SliverGridDelegateWithFixedCrossAxisCount(
      //                   crossAxisCount: 2,
      //                   mainAxisSpacing: 15,
      //                   crossAxisSpacing: 15,
      //                 ),
      //                 shrinkWrap: true,
      //                 itemCount: controller.listCellSurvey.length,
      //                 itemBuilder: (BuildContext ctx, index) {
      //                   return CellCard(cell: controller.listCellSurvey[index]);
      //                 },
      //               ),
      //   ),
      // ),
    );
    // StaggeredGridTile.count(
    //   crossAxisCellCount: 1,
    //   mainAxisCellCount: 1,
    //   child: GestureDetector(
    //     onTap: () => print('ec ec'),
    //     child: DottedBorder(
    //       borderType: BorderType.RRect,
    //       radius: Radius.circular(12),
    //       dashPattern: [8, 4],
    //       padding: EdgeInsets.all(6),
    //       child: ClipRRect(
    //         borderRadius: BorderRadius.all(Radius.circular(12)),
    //         child: Container(
    //           height: double.infinity,
    //           width: double.infinity,
    //           child: CachedNetworkImage(
    //             imageUrl:
    //                 'https://www.innovations-report.com/wp-content/uploads/post-pictures/corals_692440-750x563.jpg',
    //             fit: BoxFit.cover,
    //             progressIndicatorBuilder:
    //                 (context, url, downloadProgress) => Center(
    //               child: CircularProgressIndicator(
    //                   value: downloadProgress.progress),
    //             ),
    //             errorWidget: (context, url, error) =>
    //                 const Icon(Icons.error),
    //           ),
    //           // child: Image.network(
    //           //   'https://www.innovations-report.com/wp-content/uploads/post-pictures/corals_692440-750x563.jpg',
    //           //   fit: BoxFit.cover,
    //           // ),
    //         ),
    //       ),
    //     ),
    //   ),
    // ),
  }
}
