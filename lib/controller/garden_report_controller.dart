import 'dart:convert';
import 'dart:developer';

import 'package:diver/core/routes/routes.dart';
import 'package:diver/pages/garden_report.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../core/res/app.dart';
import '../models/garden_report.dart';
import '../utils/toast.dart';

class GardenReportController extends GetxController {
  var isLoading = false.obs;
  GardenReport gardenReport = GardenReport();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController bathymetryController = TextEditingController();
  TextEditingController temperatureController = TextEditingController();
  TextEditingController tidesController = TextEditingController();
  TextEditingController currentController = TextEditingController();
  TextEditingController brightnessController = TextEditingController();

  Future<void> getGardenReportById(int divingId) async {
    try {
      isLoading(true);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      Map<String, String> queryParams = {
        'DivingId': divingId.toString(),
      };
      final response = await http.get(
          Uri.parse(
                  '${AppConstants.baseUrl}/api/v1/diver/garden-reports/byDiving/')
              .replace(queryParameters: queryParams),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          });
      if (response.statusCode == 200) {
        print(response.body.toString());
        gardenReport = gardenReportFromJson(response.body);
        tidesController.text = gardenReport.tides!;
        if (gardenReport.bathymetry != null) {
          bathymetryController.text = gardenReport.bathymetry.toString();
        }
        if (gardenReport.temperature != null) {
          temperatureController.text = gardenReport.temperature.toString();
        }
        if (gardenReport.current != null) {
          currentController.text = gardenReport.current.toString();
        }
        if (gardenReport.brightness != null) {
          brightnessController.text = gardenReport.brightness.toString();
        }
      } else if (response.statusCode == 401 || response.statusCode == 403) {
        Get.offAllNamed(Routes.login);
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> createGardenReport(int divingId, int gardenId) async {
    final isValid = formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    try {
      isLoading(true);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      String body = json.encode({
        'divingSurveyID': divingId,
        "gardenId": gardenId,
        'bathymetry': bathymetryController.text,
        'temperature': temperatureController.text,
        'brightness': brightnessController.text,
        'tides': tidesController.text,
        'current': currentController.text,
      });
      final response = await http.put(
          Uri.parse(
              '${AppConstants.baseUrl}/api/v1/diver/garden-reports/byDivingsurvey'),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: body);
      if (response.statusCode == 200) {
        Get.back();

        showMyToast('update-success'.tr);
      } else {
        showMyToast('update-fail'.tr);
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
      update();
    }
  }

  String? validate(String value, String message) {
    if (value.isEmpty) {
      return message;
    }
    return null;
  }
}
