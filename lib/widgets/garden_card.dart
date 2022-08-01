import 'package:diver/core/res/status.dart';
import 'package:diver/models/cell_survey.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GardenCard extends StatelessWidget {
  Garden garden;
  GardenCard({Key? key, required this.garden}) : super(key: key);

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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('name'.tr),
                Text(garden.name!,
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
                          Text('Địa chỉ'.tr),
                          Text(garden.address!,
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
                          Text('garden-type'.tr),
                          Text(garden.gardenTypeName!,
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
                          Text('Diện tích'.tr),
                          Text(garden.acreage.toString(),
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
                          Text('quantity'.tr),
                          Text(garden.quantityOfCells.toString(),
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
                          Text('site'.tr),
                          Text(garden.siteName!,
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
                          Text('status'.tr),
                          Text('${AppStatus.statusDiverTeam[garden.status]}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                    ],
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
