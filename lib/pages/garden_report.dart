import 'package:diver/controller/garden_report_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GardenReportScreen extends StatelessWidget {
  const GardenReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GardenReportController gardenReportController =
        Get.find<GardenReportController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'report'.tr,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 18,
              ),
            ),
            onPressed: () => gardenReportController.createGardenReport(
              Get.arguments['divingId'],
              Get.arguments['gardenId'],
            ),
            child: Text('done'.tr,
                style: const TextStyle(
                  color: Colors.black,
                )),
          ),
        ],
      ),
      body: Form(
        key: gardenReportController.formkey,
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormField(
                  controller: gardenReportController.temperatureController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    suffixText: '°C',
                    // suffixIcon: const Icon(Icons.thermostat),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    labelText: 'temperature'.tr,
                    fillColor: Colors.white70,
                    alignLabelWithHint: true,
                    isDense: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: gardenReportController.brightnessController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    suffixText: 'cd',
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    labelText: 'brightness'.tr,
                    fillColor: Colors.white70,
                    alignLabelWithHint: true,
                    isDense: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: gardenReportController.tidesController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    labelText: 'tides'.tr,
                    suffixText: 'm',
                    fillColor: Colors.white70,
                    alignLabelWithHint: true,
                    isDense: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: gardenReportController.currentController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    suffixText: 'm³/s',
                    labelText: 'current'.tr,
                    fillColor: Colors.white70,
                    alignLabelWithHint: true,
                    isDense: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: gardenReportController.bathymetryController,
                  textInputAction: TextInputAction.done,
                  // onEditingComplete: () =>
                  //     gardenReportController.createGardenReport,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    labelText: 'bathymetry'.tr,
                    suffixText: 'm',
                    fillColor: Colors.white70,
                    alignLabelWithHint: true,
                    isDense: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )),
      ),
    );
  }
}
