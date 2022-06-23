import 'dart:io';

import 'package:diver/core/res/app.dart';
import 'package:diver/core/routes/routes.dart';
import 'package:diver/models/cell_survey.dart';
import 'package:diver/models/cell.dart';
import 'package:diver/models/survey.dart';
import 'package:diver/pages/survey_task.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../pages/cell_survey.dart';

class SurveyController extends GetxController {
  List<File> listImage = <File>[].obs;
  String? imageLink = "";
  var isLoading = false.obs;
  List<Survey> listSurvey = <Survey>[].obs;
  List<Cell> listCellSurvey = <Cell>[].obs;
  CellResponse cellResponse = CellResponse();
  Cell? cell = Cell();
  var isUpdate = false.obs;

  @override
  onInit() {
    getAll();
    super.onInit();
  }

  Future<void> getAll() async {
    try {
      isLoading(true);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      final String? diverId = prefs.getString('diverId');

      Map<String, String> queryParams = {
        'DiverId': diverId!,
      };
      final response = await http.get(
          Uri.parse('${AppConstants.baseUrl}/api/v1/diver/diving-surveys')
              .replace(queryParameters: queryParams),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${token}"
          });
      print(response.statusCode);
      if (response.statusCode == 200) {
        var surveys = divingSurveyResponseFromJson(response.body);
        if (surveys.items!.isNotEmpty) {
          listSurvey = surveys.items as List<Survey>;
        }
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> getBySurveyId(Survey survey) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      final String? diverId = prefs.getString('diverId');

      Map<String, String> queryParams = {
        'DivingSurveyId': survey.id.toString(),
        'DiverId': diverId!,
        // 'DiverId': information.diver.id.toString(),
      };
      final response = await http.get(
          Uri.parse('${AppConstants.baseUrl}/api/v1/diver/cell-surveys')
              .replace(queryParameters: queryParams),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${token}"
          });

      if (response.statusCode == 200) {
        var cellSurvey = cellSurveyResponseFromJson(response.body);
        if (cellSurvey.items!.isNotEmpty) {
          listCellSurvey = cellSurvey.items as List<Cell>;
          Get.toNamed(Routes.surveyTask);
        }
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> getByCellId(Cell cell) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      listImage = [];

      final response = await http.get(
          Uri.parse(
              '${AppConstants.baseUrl}/api/v1/diver/cell-surveys/${cell.id}'),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${token}"
          });
      if (response.statusCode == 200) {
        var cellSurvey = cellResponseFromJson(response.body);

        cellResponse = cellSurvey;
        Get.to(CellImageScreen(cell: cell));
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> getByOrderId() async {
    try {
      Get.toNamed(Routes.photoTask);
    } catch (e) {
      print(e);
    }
  }

  Future<void> uploadImage(Cell cell) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    try {
      Map<String, String> headers = {
        "Authorization": "Bearer $token",
        "Content-Type": "multipart/form-data"
      };
      var postUri =
          Uri.parse("${AppConstants.baseUrl}/api/v1/diver/cell-surveys");

      var request = http.MultipartRequest("PUT", postUri);

      for (var i = 0; i < listImage.length; i++) {
        request.files.add(
            await http.MultipartFile.fromPath('imageFiles', listImage[i].path));
      }
      request.headers.addAll(headers);
      request.fields['id'] = cell.id.toString();
      request.fields['note'] = cell.note.toString();
      request.fields['MediaUrl'] = cell.mediaUrl.toString();
      request.fields['DivingSurveyId'] = cell.divingSurveyId.toString();
      // request.fields['Images[0]'] =
      //     cellResponse.images![0].imageUrl.toString();
      for (var i = 0; i < cellResponse.images!.length; i++) {
        request.fields['Images[$i].Id'] = cellResponse.images![i].id.toString();
        request.fields['Images[$i].ImageUrl'] =
            cellResponse.images![i].imageUrl.toString();
      }
      print(request);
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        Get.back();
      }
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

        listImage.add(imageTemporary);
        print(listImage.length);
        print(listImage[0]);
        update();
      }
    } catch (e) {
      print('exception');
    }
  }

  void deleteImage(int index) {
    if (cellResponse.images!.isNotEmpty) {
      cellResponse.images!.removeAt(index);
    } else if (listImage.isNotEmpty) {
      listImage.removeAt(index - cellResponse.images!.length);
    }
    update();
  }
}
