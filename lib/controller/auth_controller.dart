import 'dart:convert';
import 'dart:developer';

import 'package:diver/controller/dashboard_controller.dart';
import 'package:diver/core/res/app.dart';
import 'package:diver/core/routes/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  static bool isInitialized = false;
  String tokenDevice = '';
  @override
  onInit() {
    getAccessToken();
    super.onInit();
  }

  Future<void> getAccessToken() async {
    try {
      //set isInitialized = false;
      isInitialized = false;
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      if (token != null) {
        Map<String, String> queryParams = {
          'token': token,
        };
        final response = await http.get(
          Uri.parse('${AppConstants.baseUrl}/api/v1/account-info')
              .replace(queryParameters: queryParams),
        );
        if (response.statusCode == 200) {
          var data = json.decode(response.body);
          prefs.setString('diverId', data['id']);
          Get.offAllNamed(Routes.dashboard);
        } else {
          Get.toNamed(Routes.login);
        }
      } else {
        Get.toNamed(Routes.login);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> login(email, password) async {
    try {
      String data = json.encode(
        {
          'username': email.text,
          'password': password.text,
          'deviceId': tokenDevice
        },
      );
      final response = await http.post(
        Uri.parse('${AppConstants.baseUrl}/api/v1/login'),
        headers: {
          "Content-Type": "application/json",
        },
        body: data,
      );
      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        final data = json.decode(response.body);
        prefs.setString('token', data['token']);
        getAccessToken();
        Get.offAllNamed(Routes.dashboard);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    DashBoardController controller = Get.find<DashBoardController>();
    controller.tabIndex = 0;
    Get.offAllNamed(Routes.login);
  }

  void setTokenDevice(String token) {
    tokenDevice = token;
    update();
  }
}
