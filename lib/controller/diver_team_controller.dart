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
    try {
      isLoading(true);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      final String? diverId = prefs.getString('diverId');
      print(diverId);
      Map<String, String> queryParams = {
        'DiverId': diverId!
        // 'Status': tabIndexNew.toString(),
      };
      final response = await http.get(
          Uri.parse('${AppConstants.baseUrl}/api/v1/diver/diver-teams')
              .replace(queryParameters: queryParams),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          });
      print(response.statusCode);
      if (response.statusCode == 200) {
        var diverTeams = diverTeamsResponseFromJson(response.body);
        print(diverTeams.items!.length);
        if (diverTeams.items!.isNotEmpty) {
          listDiverTeam = diverTeams.items as List<DiverTeams>;
        }
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
      update();
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
