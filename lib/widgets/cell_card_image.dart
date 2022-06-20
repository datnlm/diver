import 'package:diver/controller/survey_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
    return StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: GestureDetector(
        onTap: () => _surveyController.pickImage(true),
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          dashPattern: [8, 4],
          padding: const EdgeInsets.all(6),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: _surveyController.listImage.isNotEmpty
                  ? GetBuilder<SurveyController>(
                      builder: (controller) =>
                          controller.listImage.length == imageIndex
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.add,
                                      size: 60,
                                    ),
                                  ],
                                )
                              : Image.file(controller.listImage[imageIndex],
                                  fit: BoxFit.cover),
                    )
                  : Column(
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
    );
  }
}
