import 'package:diver/controller/survey_controller.dart';
import 'package:diver/core/routes/routes.dart';
import 'package:diver/models/cell_survey.dart';
import 'package:diver/models/survey.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../core/res/status.dart';

class CellCard extends StatefulWidget {
  final Cell cell;

  const CellCard({Key? key, required this.cell}) : super(key: key);

  @override
  State<CellCard> createState() => _CellCardState();
}

class _CellCardState extends State<CellCard> {
  final SurveyController _surveyController = Get.find<SurveyController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
            Get.toNamed(Routes.cellSurvey);
            _surveyController.getCellById(widget.cell);
          },
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('cell'.tr),
              Text('#${widget.cell.coralCellId}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('diver-name'.tr),
                        Text(widget.cell.diverName!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('status'.tr),
                    Text('${AppStatus.statusDivingSurvey[widget.cell.status]}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
              ],
            ),
          ),
          leading: _getCorrectIcon(widget.cell.status!),
        ),
      ),
    );
  }

  SizedBox _getCorrectIcon(int status) {
    switch (status) {
      case 0:
        return const SizedBox(
          height: double.infinity,
          child:
              Icon(Icons.cancel_outlined, size: 40.0, color: Colors.redAccent),
        );
      case 1:
        return const SizedBox(
          height: double.infinity,
          child:
              Icon(Icons.history_toggle_off, size: 40.0, color: Colors.black),
        );
      case 3:
        return const SizedBox(
          height: double.infinity,
          child: Icon(Icons.check, size: 40.0, color: Colors.green),
        );
      default:
        return const SizedBox(
          height: double.infinity,
          child:
              Icon(Icons.history_toggle_off, size: 40.0, color: Colors.black),
        );
    }
  }
}
