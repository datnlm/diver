import 'dart:developer';
import 'dart:io';

import 'package:diver/core/res/app.dart';
import 'package:diver/models/cell_survey.dart';
import 'package:diver/models/cell.dart';
import 'package:diver/models/survey.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../utils/toast.dart';

class SurveyController extends GetxController {
  bool isViewCalendar = true;
  List<File> listImage = <File>[].obs;
  String? imageLink = "";
  var isLoading = false.obs;
  List<Survey> listSurvey = <Survey>[].obs;
  List<Cell> listCellSurvey = <Cell>[].obs;
  CellResponse cellResponse = CellResponse();
  var tabIndex = 0;
  Cell? cell = Cell();
  var isUpdate = false.obs;
  late DateTime focusedDay;

  @override
  onInit() {
    focusedDay = DateTime.now();
    getByDateTime(focusedDay);
    super.onInit();
  }

  Future<void> getAll() async {
    try {
      isLoading(true);
      update();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      final String? diverId = prefs.getString('diverId');

      Map<String, String> queryParams = {
        'DiverId': diverId!
        // 'DiverId': diverId!,
        // 'Status': tabIndex.toString(),
      };
      final response = await http.get(
          Uri.parse('${AppConstants.baseUrl}/api/v1/diver/diving-surveys')
              .replace(queryParameters: queryParams),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          });

      print(response.statusCode);
      if (response.statusCode == 200) {
        var surveys = divingSurveyResponseFromJson(response.body);
        if (surveys.items!.isNotEmpty) {
          listSurvey = surveys.items as List<Survey>;
        }
      } else {
        listSurvey = [];
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> getByDateTime(DateTime selectedDay) async {
    try {
      switch (tabIndex) {
        case 0:
          tabIndex = 1;
          break;
        case 1:
          tabIndex = 2;
          break;
        case 2:
          tabIndex = 3;
          break;
        default:
          tabIndex = 0;
      }
      print(tabIndex);
      isLoading(true);
      update();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      final String? diverId = prefs.getString('diverId');

      Map<String, String> queryParams = {
        'DiverId': diverId!,
        'Status': tabIndex.toString(),
        'StartTime': DateFormat('yyyy-MM-dd').format(selectedDay),
      };
      final response = await http.get(
          Uri.parse('${AppConstants.baseUrl}/api/v1/diver/diving-surveys')
              .replace(queryParameters: queryParams),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          });

      print(response.statusCode);
      if (response.statusCode == 200) {
        var surveys = divingSurveyResponseFromJson(response.body);
        if (surveys.items!.isNotEmpty) {
          listSurvey = surveys.items as List<Survey>;
        }
      } else {
        listSurvey = [];
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> getSurveyById(String surveyId) async {
    try {
      isLoading(true);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      final String? diverId = prefs.getString('diverId');

      Map<String, String> queryParams = {
        'DivingSurveyId': surveyId.toString(),
        'DiverId': diverId!,
        // 'DiverId': information.diver.id.toString(),
      };
      final response = await http.get(
          Uri.parse('${AppConstants.baseUrl}/api/v1/diver/cell-surveys')
              .replace(queryParameters: queryParams),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          });

      if (response.statusCode == 200) {
        var cellSurvey = cellSurveyResponseFromJson(response.body);
        if (cellSurvey.items!.isNotEmpty) {
          listCellSurvey = cellSurvey.items as List<Cell>;
        }
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> getCellById(Cell cell) async {
    try {
      this.cell = cell;
      isLoading(true);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      listImage = [];

      final response = await http.get(
          Uri.parse(
              '${AppConstants.baseUrl}/api/v1/diver/cell-surveys/${cell.id}'),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          });

      if (response.statusCode == 200) {
        var cellSurvey = cellResponseFromJson(response.body);

        cellResponse = cellSurvey;
        // Get.to(CellSurveyScreen(cell: cell));
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> uploadImage() async {
    try {
      if (cell != null) {
        isLoading(true);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final String? token = prefs.getString('token');
        Map<String, String> headers = {
          "Authorization": "Bearer $token",
          "Content-Type": "multipart/form-data"
        };
        var postUri =
            Uri.parse("${AppConstants.baseUrl}/api/v1/diver/cell-surveys");

        var request = http.MultipartRequest("PUT", postUri);

        for (var i = 0; i < listImage.length; i++) {
          request.files.add(await http.MultipartFile.fromPath(
              'imageFiles', listImage[i].path));
        }
        request.headers.addAll(headers);
        request.fields['id'] = cell!.id.toString();
        if (cell!.note != null) {
          request.fields['note'] = cell!.note;
        }
        request.fields['status'] = cell!.status.toString();
        request.fields['MediaUrl'] = cell!.mediaUrl.toString();
        request.fields['DivingSurveyId'] = cell!.divingSurveyId.toString();
        for (var i = 0; i < cellResponse.images!.length; i++) {
          request.fields['Images[$i].Id'] =
              cellResponse.images![i].id.toString();
          request.fields['Images[$i].ImageUrl'] =
              cellResponse.images![i].imageUrl.toString();
        }
        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          Get.back();
          Get.back();
          showMyToast("Lưu thành công");
        } else {
          showMyToast("Lưu thất bại");
        }
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
      update();
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

        listImage.add(imageTemporary);
        update();
      }
    } catch (e) {
      log(e.toString());
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

  void changeViewTab() {
    isViewCalendar = !isViewCalendar;
    if (!isViewCalendar) {
      getAll();
    } else {
      getByDateTime(focusedDay);
    }
    update();
  }
}
