import 'package:diver/controller/garden_report_controller.dart';
import 'package:diver/controller/survey_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GardenReportScreen extends StatefulWidget {
  const GardenReportScreen({Key? key}) : super(key: key);

  @override
  State<GardenReportScreen> createState() => _GardenReportScreenState();
}

final GardenReportController gardenReportController =
    Get.find<GardenReportController>();
final SurveyController surveyController = Get.find<SurveyController>();

class _GardenReportScreenState extends State<GardenReportScreen> {
  @override
  Widget build(BuildContext context) {
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
          surveyController.cellResponse.status != 3
              ? TextButton(
                  onPressed: () => gardenReportController.createGardenReport(
                    Get.arguments['divingId'],
                    Get.arguments['gardenId'],
                  ),
                  child: Text('done'.tr,
                      style: const TextStyle(
                        color: Colors.black,
                      )),
                )
              : TextButton(
                  onPressed: () {},
                  child: Text('done'.tr,
                      style: const TextStyle(
                        color: Colors.grey,
                      )),
                ),
        ],
      ),
      body: GetBuilder<GardenReportController>(
        builder: (controller) => controller.isLoading.isTrue
            ? const Center(child: CircularProgressIndicator())
            : Form(
                key: controller.formkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: ListView(
                      children: <Widget>[
                        TextFormField(
                          controller: controller.temperatureController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            return controller.validate(
                                value!, 'validate-garden-report'.tr);
                          },
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
                          controller: controller.brightnessController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            return controller.validate(
                                value!, 'validate-garden-report'.tr);
                          },
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
                          controller: controller.tidesController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            return controller.validate(
                                value!, 'validate-garden-report'.tr);
                          },
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
                          controller: controller.currentController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            return controller.validate(
                                value!, 'validate-garden-report'.tr);
                          },
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
                          controller: controller.bathymetryController,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            return controller.validate(
                                value!, 'validate-garden-report'.tr);
                          },
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
      ),
    );
  }
}
