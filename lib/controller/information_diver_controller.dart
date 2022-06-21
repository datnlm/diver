import 'dart:convert';

import 'package:diver/models/diver.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InformationDiverController extends GetxController {
  Diver diver = Diver();

  @override
  onInit() {
    getDiver();
    super.onInit();
  }

  Future<void> getDiver() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? diverPref = prefs.getString('diver');
    Map<String, dynamic> data = jsonDecode(diverPref!) as Map<String, dynamic>;
    diver = Diver(
      name: data['name'],
      username: data['username'],
      role: data['role'],
      imageUrl: data['imageUrl'],
      roleName: data['roleName'],
      id: data['id'],
    );

    update();
  }
}
