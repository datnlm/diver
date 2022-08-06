import 'dart:developer';
import 'dart:io';
import 'package:diver/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../core/res/app.dart';
import '../models/diver.dart';

class InformationController extends GetxController {
  var isLoading = false.obs;
  File? image;
  String title = "";
  String typeField = "";
  Diver diver = Diver();

  @override
  onInit() {
    fetch();
    super.onInit();
  }

  fetch() async {
    getDiver();
    update();
  }

  TextEditingController textField = TextEditingController();

  final formkey = GlobalKey<FormState>();

  Future<void> getDiver() async {
    try {
      isLoading(true);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      final String? id = prefs.getString('diverId');

      final response = await http.get(
          Uri.parse('${AppConstants.baseUrl}/api/v1/diver/divers/$id'),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          });
      if (response.statusCode == 200) {
        prefs.setString('diver', response.body);
        var data = diverFromJson(response.body);
        diver = data;
        update();
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

  Future<void> initTextField(String type) async {
    typeField = type;
    switch (type) {
      case "name":
        title = 'name'.tr;
        textField.text = diver.name!;
        break;
      case "phone":
        title = 'phone'.tr;
        textField.text = diver.phone!;
        break;
      case "address":
        title = 'address'.tr;
        textField.text = diver.address!;
        break;
      default:
        log(type);
        break;
    }
    Get.toNamed(Routes.updateInformation);
    update();
  }

  Future<void> updateInformation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    Get.back();
    try {
      switch (typeField) {
        case "name":
          diver.name = textField.text;
          break;
        case "phone":
          diver.phone = textField.text;
          break;
        case "address":
          diver.address = textField.text;
          break;
        default:
      }
      Map<String, String> headers = {
        "Authorization": "Bearer $token",
        "Content-Type": "multipart/form-data"
      };
      var postUri = Uri.parse("${AppConstants.baseUrl}/api/v1/diver/divers");

      var request = http.MultipartRequest("PUT", postUri);
      if (image != null) {
        http.MultipartFile multipartFile =
            await http.MultipartFile.fromPath('imageFile', image!.path);
        request.files.add(multipartFile);
      }
      request.headers.addAll(headers);
      request.fields['id'] = diver.id.toString();
      request.fields['name'] = diver.name.toString();
      request.fields['phone'] = diver.phone.toString();
      request.fields['ImageUrl'] = diver.imageUrl.toString();
      request.fields['email'] = diver.email.toString();
      request.fields['address'] = diver.address.toString();

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        image = null;
        getDiver();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future pickImage(bool isCamera) async {
    try {
      final XFile? image;
      if (!isCamera) {
        image = await ImagePicker().pickImage(source: ImageSource.gallery);
      } else {
        image = await ImagePicker().pickImage(source: ImageSource.camera);
      }
      if (image != null) {
        final imageTemporary = File(image.path);
        this.image = imageTemporary;
        Get.back();
        updateInformation();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
