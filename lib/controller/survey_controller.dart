import 'dart:developer';
import 'dart:io';

import 'package:diver/controller/auth_controller.dart';
import 'package:diver/core/res/app.dart';
import 'package:diver/models/cell_survey.dart';
import 'package:diver/models/cell.dart';
import 'package:diver/models/survey.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../core/routes/routes.dart';
import '../utils/toast.dart';

class SurveyController extends GetxController {
  bool isViewCalendar = true;
  List<File> listImage = <File>[].obs;
  String? imageLink = "";
  var isLoadingAll = false.obs;
  var isLoading = false.obs;
  List<Survey> listSurvey = <Survey>[].obs;
  List<Cell> listCellSurvey = <Cell>[].obs;
  CellResponse cellResponse = CellResponse();
  var dateClick = false;
  var notfiClick = false;
  var tabIndexNew = 0;
  var tabIndexPrevious = -1;
  var tabTaskIndexNew = 0;
  var tabTaskIndexPrevious = -1;
  Cell? cell = Cell();
  var isUpdate = false.obs;
  late DateTime focusedDay;

  @override
  onInit() {
    tabIndexNew = 0;
    tabIndexPrevious = -1;
    focusedDay = DateTime.now();
    getByDateTime(focusedDay);
    super.onInit();
  }

  Future<void> getAll() async {
    if (tabIndexPrevious != tabIndexNew || dateClick) {
      try {
        dateClick = false;
        tabIndexPrevious = tabIndexNew;
        isLoading(true);
        update();
        var status = '0';
        switch (tabIndexNew) {
          case 0:
            status = '1';
            break;
          case 1:
            status = '3';
            break;
          case 2:
            status = '0';
            break;
          case 3:
            status = '-2';
            break;
          default:
            status = '0';
        }
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final String? token = prefs.getString('token');
        final String? diverId = prefs.getString('diverId');

        Map<String, String> queryParams = {
          'DiverId': diverId!,
          'Status': status,
          "page_number": '1',
          "page_size": '-1'
        };
        final response = await http.get(
            Uri.parse('${AppConstants.baseUrl}/api/v1/diver/diving-surveys')
                .replace(queryParameters: queryParams),
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token"
            });

        if (response.statusCode == 200) {
          var surveys = divingSurveyResponseFromJson(response.body);
          if (surveys.items!.isNotEmpty) {
            listSurvey = surveys.items as List<Survey>;
          }
        } else if (response.statusCode == 401 || response.statusCode == 403) {
          Get.offAllNamed(Routes.login);
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
  }

  void getLoading() {
    notfiClick = true;
    isLoadingAll(true);
    update();
  }

  Future<void> getByDateTime(DateTime selectedDay) async {
    if (tabIndexPrevious != tabIndexNew || dateClick) {
      try {
        dateClick = false;
        tabIndexPrevious = tabIndexNew;
        var status = '0';
        switch (tabIndexNew) {
          case 0:
            status = '1';
            break;
          case 1:
            status = '3';
            break;
          case 2:
            status = '0';
            break;
          case 3:
            status = '-2';
            break;
          default:
            status = '0';
        }
        isLoading(true);
        update();
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final String? token = prefs.getString('token');
        final String? diverId = prefs.getString('diverId');

        Map<String, String> queryParams = {
          'DiverId': diverId!,
          'Status': status,
          'StartTime': DateFormat('yyyy-MM-dd').format(selectedDay),
          "page_number": '1',
          "page_size": '-1'
        };
        final response = await http.get(
            Uri.parse('${AppConstants.baseUrl}/api/v1/diver/diving-surveys')
                .replace(queryParameters: queryParams),
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token"
            });

        if (response.statusCode == 200) {
          AuthController.isInitialized = false;
          var surveys = divingSurveyResponseFromJson(response.body);
          if (surveys.items!.isNotEmpty) {
            listSurvey = surveys.items as List<Survey>;
          } else {
            listSurvey = [];
          }
        } else if (response.statusCode == 401 || response.statusCode == 403) {
          Get.offAllNamed(Routes.login);
        } else {
          listSurvey = [];
        }
      } catch (e) {
        log(e.toString());
      } finally {
        isLoadingAll(false);
        isLoading(false);
        update();
      }
    }
  }

  Future<void> getSurveyById(String surveyId) async {
    if (tabTaskIndexNew != tabTaskIndexPrevious || notfiClick) {
      try {
        notfiClick = false;
        tabTaskIndexPrevious = tabTaskIndexNew;
        isLoading(true);
        update();
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final String? token = prefs.getString('token');
        final String? diverId = prefs.getString('diverId');

        Map<String, String> queryParams;
        if (tabTaskIndexNew == 1) {
          queryParams = {
            'DivingSurveyId': surveyId.toString(),
            // 'DiverId': information.diver.id.toString(),
          };
        } else {
          queryParams = {
            'DivingSurveyId': surveyId.toString(),
            'DiverId': diverId!.toString(),
            // 'DiverId': information.diver.id.toString(),
          };
        }

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
        } else if (response.statusCode == 401 || response.statusCode == 403) {
          Get.offAllNamed(Routes.login);
        }
      } catch (e) {
        log(e.toString());
      } finally {
        isLoadingAll(false);
        isLoading(false);
        update();
      }
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
        request.fields['DiverMemberId'] = cell!.diverMemberId.toString();
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
          showMyToast('save-success'.tr);
        } else {
          showMyToast('save-failed'.tr);
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
      dateClick = true;
      getAll();
    } else {
      dateClick = true;
      getByDateTime(focusedDay);
    }
    update();
  }
}
