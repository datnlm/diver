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
        title: const Text(
          'Report',
          style: TextStyle(
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
            child: const Text('Xong',
                style: TextStyle(
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
                    suffixIcon: const Icon(Icons.thermostat),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    labelText: 'Nhiệt độ',
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
                    suffixIcon: const Icon(Icons.light_mode),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    labelText: 'Ánh sáng',
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
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    suffixIcon: const Icon(Icons.waves_rounded),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    labelText: 'Thuỷ triều',
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
                    suffixIcon: const Icon(Icons.roundabout_right_outlined),
                    labelText: 'Dòng chảy',
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
                    suffixIcon:
                        const Icon(Icons.keyboard_double_arrow_down_outlined),
                    labelText: 'Độ sâu',
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
