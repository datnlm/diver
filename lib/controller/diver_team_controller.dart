import 'dart:developer';

import 'package:diver/core/res/app.dart';
import 'package:diver/models/diver_teams.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../models/diver_team.dart';

class DiverTeamController extends GetxController {
  List<DiverTeams> listDiverTeam = <DiverTeams>[].obs;
  DiverTeam diverTeam = DiverTeam();
  var isLoading = false.obs;
  var tabIndexNew = 0;
  var tabIndexPrevious = -1;
  @override
  onInit() {
    fetch();
    super.onInit();
  }

  fetch() async {
    getListDiverTeam();
    update();
  }

  Future<void> getListDiverTeam() async {
    if (tabIndexPrevious != tabIndexNew) {
      try {
        tabIndexPrevious = tabIndexNew;
        isLoading(true);
        update();
        var status = 0;
        switch (tabIndexNew) {
          case 0:
            status = 1;
            break;
          case 1:
            status = 0;
            break;
          default:
        }
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final String? token = prefs.getString('token');
        final String? diverId = prefs.getString('diverId');
        Map<String, String> queryParams = {
          'DiverId': diverId!,
          'Status': status.toString(),
        };
        final response = await http.get(
            Uri.parse('${AppConstants.baseUrl}/api/v1/diver/diver-teams')
                .replace(queryParameters: queryParams),
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token"
            });
        if (response.statusCode == 200) {
          var diverTeams = diverTeamsResponseFromJson(response.body);
          if (diverTeams.items!.isNotEmpty) {
            listDiverTeam = diverTeams.items as List<DiverTeams>;
          } else {
            listDiverTeam = [];
          }
        } else {
          listDiverTeam = [];
        }
      } catch (e) {
        log(e.toString());
      } finally {
        isLoading(false);
        update();
      }
    }
  }

  Future<void> getDiverTeamById(int diverTeamId) async {
    try {
      isLoading(true);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      final response = await http.get(
          Uri.parse(
              '${AppConstants.baseUrl}/api/v1/diver/diver-teams/$diverTeamId'),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          });
      if (response.statusCode == 200) {
        var data = diverTeamResponseFromJson(response.body);

        diverTeam = data;
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
      update();
    }
  }
}
