import 'dart:convert';

import 'package:diver/core/res/app.dart';
import 'package:diver/core/routes/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
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
        Get.toNamed(Routes.home);
      }
    } catch (e) {
      print(e);
    }
  }
}
