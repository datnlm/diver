import 'dart:convert';

import 'package:diver/core/res/app.dart';
import 'package:diver/core/routes/routes.dart';
import 'package:diver/models/diver.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';

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
      print(response.statusCode);
      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        final data = json.decode(response.body);
        prefs.setString('token', data['token']);
        Map<String, dynamic> payload = Jwt.parseJwt(data['token']);
        prefs.setString('diver', json.encode(payload));
        print(payload);
        Get.toNamed(Routes.home);
      }
    } catch (e) {
      print(e);
    }
  }
}
