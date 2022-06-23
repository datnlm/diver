import 'dart:convert';

import 'package:diver/controller/dashboard_controller.dart';
import 'package:diver/controller/information_controller.dart';
import 'package:diver/core/res/app.dart';
import 'package:diver/core/routes/routes.dart';
import 'package:diver/models/diver.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthController extends GetxController {
  Future<void> login(email, password) async {
    try {
      String data = json.encode(
        {'username': email.text, 'password': password.text},
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
        getAccessToken(data['token']);
        Get.toNamed(Routes.dashboard);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getAccessToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();

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

        return response.statusCode;
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    DashBoardController controller = Get.find<DashBoardController>();
    controller.tabIndex = 0;
    Get.toNamed(Routes.login);
  }
}