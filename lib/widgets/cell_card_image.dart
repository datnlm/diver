import 'package:diver/controller/survey_controller.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../models/cell_survey.dart';

class CellImageCard extends StatelessWidget {
  final int imageIndex;
  const CellImageCard({Key? key, required this.imageIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SurveyController _surveyController = Get.find<SurveyController>();

    return Stack(
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          dashPattern: const [8, 4],
          padding: const EdgeInsets.all(6),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: _surveyController.listImage.isNotEmpty ||
                      _surveyController.cellResponse.images!.isNotEmpty
                  ? GetBuilder<SurveyController>(
                      builder: (controller) => controller.listImage.length ==
                              imageIndex -
                                  (controller.cellResponse.images!.isNotEmpty
                                      ? controller.cellResponse.images!.length
                                      : 0)
                          ? GestureDetector(
                              onTap: () => _surveyController.pickImage(true),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.add,
                                    size: 60,
                                  ),
                                ],
                              ),
                            )
                          : imageIndex -
                                      (controller
                                              .cellResponse.images!.isNotEmpty
                                          ? controller
                                              .cellResponse.images!.length
                                          : 0) <
                                  0
                              ? CachedNetworkImage(
                                  imageUrl: controller.cellResponse
                                          .images![imageIndex].imageUrl ??
                                      '',
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Center(
                                    child: CircularProgressIndicator(
                                        value: downloadProgress.progress),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                )
                              : Image.file(
                                  controller.listImage[imageIndex -
                                      (controller
                                              .cellResponse.images!.isNotEmpty
                                          ? controller
                                              .cellResponse.images!.length
                                          : 0)],
                                  fit: BoxFit.cover),
                    )
                  : GestureDetector(
                      onTap: () => _surveyController.pickImage(true),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add,
                            size: 60,
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
        if (imageIndex <
            _surveyController.cellResponse.images!.length +
                _surveyController.listImage.length)
          Positioned(
            bottom: 0,
            right: 4,
            child: GestureDetector(
              onTap: () => _surveyController.deleteImage(imageIndex),
              // onTap: () => print(imageIndex),
              child: buildDeleteIcon(Theme.of(context).colorScheme.primary),
            ),
          ),
      ],
    );
  }

  Widget buildDeleteIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
