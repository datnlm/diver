// To parse this JSON data, do
//
//     final divingSurveyResponse = divingSurveyResponseFromJson(jsonString);

import 'dart:convert';

DivingSurveyResponse divingSurveyResponseFromJson(String str) =>
    DivingSurveyResponse.fromJson(json.decode(str));

String divingSurveyResponseToJson(DivingSurveyResponse data) =>
    json.encode(data.toJson());

class DivingSurveyResponse {
  DivingSurveyResponse({
    this.metaData,
    this.items,
  });

  MetaData? metaData;
  List<Survey>? items;

  factory DivingSurveyResponse.fromJson(Map<String, dynamic> json) =>
      DivingSurveyResponse(
        metaData: MetaData.fromJson(json["metaData"]),
        items: List<Survey>.from(json["items"].map((x) => Survey.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "metaData": metaData!.toJson(),
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Survey {
  Survey({
    this.id,
    this.name,
    this.startTime,
    this.endTime,
    this.diverTeamId,
    this.diverTeamName,
    this.gardenId,
    this.gardenName,
    this.status,
    this.cellSurveys,
  });

  int? id;
  String? name;
  DateTime? startTime;
  DateTime? endTime;
  int? diverTeamId;
  String? diverTeamName;
  int? gardenId;
  String? gardenName;
  int? status;
  dynamic cellSurveys;

  factory Survey.fromJson(Map<String, dynamic> json) => Survey(
        id: json["id"],
        name: json["name"],
        startTime: DateTime.parse(json["startTime"]),
        endTime: DateTime.parse(json["endTime"]),
        diverTeamId: json["diverTeamId"],
        diverTeamName: json["diverTeamName"],
        gardenId: json["gardenId"],
        gardenName: json["gardenName"],
        status: json["status"],
        cellSurveys: json["cellSurveys"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "startTime": startTime!.toIso8601String(),
        "endTime": endTime!.toIso8601String(),
        "diverTeamId": diverTeamId,
        "diverTeamName": diverTeamName,
        "gardenId": gardenId,
        "gardenName": gardenName,
        "status": status,
        "cellSurveys": cellSurveys,
      };
}

class MetaData {
  MetaData({
    this.currentPage,
    this.totalPages,
    this.pageSize,
    this.totalCount,
    this.hasPrevious,
    this.hasNext,
    this.previousPage,
    this.currentPageUri,
    this.nextPage,
    this.firstPage,
    this.lastPage,
  });

  int? currentPage;
  int? totalPages;
  int? pageSize;
  int? totalCount;
  bool? hasPrevious;
  bool? hasNext;
  dynamic previousPage;
  String? currentPageUri;
  dynamic nextPage;
  String? firstPage;
  String? lastPage;

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        pageSize: json["pageSize"],
        totalCount: json["totalCount"],
        hasPrevious: json["hasPrevious"],
        hasNext: json["hasNext"],
        previousPage: json["previousPage"],
        currentPageUri: json["currentPageUri"],
        nextPage: json["nextPage"],
        firstPage: json["firstPage"],
        lastPage: json["lastPage"],
      );

  Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "totalPages": totalPages,
        "pageSize": pageSize,
        "totalCount": totalCount,
        "hasPrevious": hasPrevious,
        "hasNext": hasNext,
        "previousPage": previousPage,
        "currentPageUri": currentPageUri,
        "nextPage": nextPage,
        "firstPage": firstPage,
        "lastPage": lastPage,
      };
}
