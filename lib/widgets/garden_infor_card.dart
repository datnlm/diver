import 'package:diver/controller/diver_team_controller.dart';
import 'package:diver/core/routes/routes.dart';
import 'package:diver/models/diver_teams.dart';
import 'package:diver/models/survey.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../core/res/status.dart';

class GardenInformationCard extends StatefulWidget {
  final DiverTeams diverTeam;
  const GardenInformationCard({Key? key, required this.diverTeam})
      : super(key: key);

  @override
  State<GardenInformationCard> createState() => _GardenInformationCardState();
}

class _GardenInformationCardState extends State<GardenInformationCard> {
  final DiverTeamController diverTeamController =
      Get.find<DiverTeamController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () => {
              diverTeamController.getDiverTeamById(widget.diverTeam.id!),
              Get.toNamed(Routes.information_diver),
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('name'.tr),
                Text(widget.diverTeam.name!,
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
                          Text('quantity'.tr),
                          Text(widget.diverTeam.number.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('start:'.tr),
                          Text(
                              DateFormat.yMMMMEEEEd(Get.locale!.toLanguageTag())
                                  .format(widget.diverTeam.createTime!),
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('status:'.tr),
                      Text(
                          '${AppStatus.statusDivingSurvey[widget.diverTeam.status]}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            leading: _getCorrectIcon(widget.diverTeam.status!),
          ),
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
