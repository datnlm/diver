// To parse this JSON data, do
//
//     final gardenReportReponse = gardenReportReponseFromJson(jsonString);

import 'dart:convert';

GardenReport gardenReportFromJson(String str) =>
    GardenReport.fromJson(json.decode(str));

String gardenReportToJson(GardenReport data) => json.encode(data.toJson());

class GardenReport {
  GardenReport({
    this.id,
    this.divingSurveyId,
    this.bathymetry,
    this.temperature,
    this.brightness,
    this.tides,
    this.current,
    this.gardenId,
    this.summary,
  });

  int? id;
  int? divingSurveyId;
  DateTime? createTime;
  double? bathymetry;
  double? temperature;
  double? brightness;
  String? tides;
  double? current;
  int? gardenId;
  dynamic summary;

  factory GardenReport.fromJson(Map<String, dynamic> json) => GardenReport(
        id: json["id"],
        divingSurveyId: json["divingSurveyID"],
        bathymetry: json["bathymetry"],
        temperature: json["temperature"],
        brightness: json["brightness"],
        tides: json["tides"],
        current: json["current"],
        gardenId: json["gardenId"],
        summary: json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "divingSurveyID": divingSurveyId,
        "createTime": createTime!.toIso8601String(),
        "bathymetry": bathymetry,
        "temperature": temperature,
        "brightness": brightness,
        "tides": tides,
        "current": current,
        "gardenId": gardenId,
        "summary": summary,
      };
}
