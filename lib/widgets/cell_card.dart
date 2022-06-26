import 'package:diver/controller/survey_controller.dart';
import 'package:diver/core/res/status.dart';
import 'package:diver/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';

import '../models/cell_survey.dart';

class CellCard extends StatelessWidget {
  final Cell cell;

  CellCard({Key? key, required this.cell}) : super(key: key);

  final SurveyController _surveyController = Get.find<SurveyController>();

  @override
  Widget build(BuildContext context) {
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
              child: GestureDetector(
                onTap: () {
                  // Get.to(CellSurveyScreen(cell: cell));
                  Get.toNamed(Routes.cellSurvey);
                  _surveyController.getCellById(cell);
                },
                onLongPress: () => showModal(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.assignment_outlined,
                      size: 60,
                    ),
                    Text('Cell: #${cell.id}'),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(
              color: _getColor(cell.status),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${AppStatus.status[cell.status]}'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color _getColor(int? status) {
    switch (status) {
      case 0:
        return Colors.redAccent;
      case 1:
        return Colors.grey[100]!;
      case 2:
        return Colors.redAccent[100]!;
      default:
        return Colors.grey;
    }
  }

  Future<void> showModal(BuildContext context) {
    return showModalBottomSheet<void>(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
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
                  children: const [
                    Text("This is a modal sheet"),
                  ],
                ),
              ),
            ),
          );
        });
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
