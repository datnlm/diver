import 'package:diver/controller/survey_controller.dart';
import 'package:diver/core/routes/routes.dart';
import 'package:diver/widgets/task_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../models/cell_survey.dart';
import '../pages/cell_survey.dart';

class CellCard extends StatelessWidget {
  final Cell cell;

  CellCard({Key? key, required this.cell}) : super(key: key);

  final SurveyController _surveyController = Get.find<SurveyController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _surveyController.getByCellId(cell),
      onLongPress: () => showModalBottomSheet<void>(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
          ),
          context: context,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("This is a modal sheet"),
                    ],
                  ),
                ),
              ),
            );
          }),
      child: StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: GestureDetector(
          onTap: () => _surveyController.getByCellId(cell),
          child: TaskGroupContainer(
            color: Colors.blue,
            isSmall: true,
            icon: Icons.check_box_outline_blank,
            taskGroup: 'Cell: #${cell.id}',
          ),
        ),
      ),
    );
  }
}
