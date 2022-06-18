import 'dart:io';

import 'package:diver/core/res/app.dart';
import 'package:diver/core/routes/routes.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SurveyController extends GetxController {
  File? image;
  String? imageLink = "";

  Future<void> getAll() async {
    try {
      try {
        final response = await http.get(
            Uri.parse('${AppConstants.baseUrl}//api/v1/FIX/diving-surveys'),
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer "
            });
            if(response.statusCode == 200){
              
            }
      } catch (e) {
        print(e);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getBySurveyId() async {
    try {
      Get.toNamed(Routes.surveyTask);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getByOrderId() async {
    try {
      Get.toNamed(Routes.photoTask);
    } catch (e) {
      print(e);
    }
  }

  Future<void> uploadImage(File? image) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final String? token = prefs.getString('token');

    try {
      print('chay vo day');
      Map<String, String> headers = {
        // "Authorization": "Bearer $token",
        "Content-Type": "multipart/form-data"
      };
      // var postUri = Uri.parse(
      //     "https://booking-yacht.azurewebsites.net/api/v1.0/business/vehicles/upload");

      // var request = http.MultipartRequest("POST", postUri);

      // http.MultipartFile multipartFile =
      //     await http.MultipartFile.fromPath('ImageFile', image!.path);
      // request.headers.addAll(headers);
      // request.files.add(multipartFile);

      // http.StreamedResponse response = await request.send();
      // var responseString = await response.stream.bytesToString();
      // imageLink = (json.decode(responseString))['data'];
      print(imageLink);
    } catch (e) {
      print(e);
    }
  }

  Future pickImage(bool isCamera) async {
    try {
      final image;
      if (!isCamera) {
        image = await ImagePicker().pickImage(source: ImageSource.gallery);
      } else {
        image = await ImagePicker().pickImage(source: ImageSource.camera);
      }
      if (image == null) {
        print('loi');
      } else {
        final imageTemporary = File(image.path);
        this.image = imageTemporary;
        uploadImage(this.image);
        print('oke');
      }
    } catch (e) {
      print('exception');
    }
  }
}
