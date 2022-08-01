import 'package:diver/models/survey.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../core/res/status.dart';

class SurveyCard extends StatelessWidget {
  final Survey survey;

  const SurveyCard({Key? key, required this.survey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('garden-name'.tr),
              Flexible(
                child: Text(survey.gardenName!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    )),
              ),
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
                        Text('diverTeam'.tr),
                        Flexible(
                          child: Text(survey.diverTeamName!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('start'.tr),
                        Text(
                            DateFormat.yMMMMEEEEd(Get.locale!.toLanguageTag())
                                .format(survey.startTime!),
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
                        Text('end'.tr),
                        Text(
                            DateFormat.yMMMMEEEEd(Get.locale!.toLanguageTag())
                                .format(survey.endTime!),
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
                    Text('${AppStatus.statusDivingSurvey[survey.status]}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
              ],
            ),
          ),
          leading: _getCorrectIcon(survey.status!),
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
