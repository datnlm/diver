// To parse this JSON data, do
//
//     final cellResponse = cellResponseFromJson(jsonString);

import 'dart:convert';

CellResponse cellResponseFromJson(String str) =>
    CellResponse.fromJson(json.decode(str));

String cellResponseToJson(CellResponse data) => json.encode(data.toJson());

class CellResponse {
  CellResponse({
    this.id,
    this.mediaUrl,
    this.images,
    this.note,
    this.coralCellId,
    this.divingSurveyId,
    this.gardenReportId,
    this.diverMemberId,
    this.status,
    this.coralItemStatuses,
  });

  int? id;
  String? mediaUrl;
  List<Image>? images;
  String? note;
  int? coralCellId;
  int? divingSurveyId;
  dynamic gardenReportId;
  int? diverMemberId;
  dynamic status;
  List<CoralItemStatus>? coralItemStatuses;

  factory CellResponse.fromJson(Map<String, dynamic> json) => CellResponse(
        id: json["id"],
        mediaUrl: json["mediaUrl"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        note: json["note"],
        coralCellId: json["coralCellId"],
        divingSurveyId: json["divingSurveyId"],
        gardenReportId: json["gardenReportId"],
        diverMemberId: json["diverMemberId"],
        status: json["status"],
        coralItemStatuses: List<CoralItemStatus>.from(
            json["coralItemStatuses"].map((x) => CoralItemStatus.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mediaUrl": mediaUrl,
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "note": note,
        "coralCellId": coralCellId,
        "divingSurveyId": divingSurveyId,
        "gardenReportId": gardenReportId,
        "diverMemberId": diverMemberId,
        "status": status,
        "coralItemStatuses":
            List<dynamic>.from(coralItemStatuses!.map((x) => x.toJson())),
      };
}

class CoralItemStatus {
  CoralItemStatus({
    this.id,
    this.cellSurveyId,
    this.coralItemId,
    this.coralId,
    this.coralName,
    this.coralPhaseId,
    this.coralPhaseName,
    this.indexItem,
    this.note,
    this.status,
  });

  int? id;
  int? cellSurveyId;
  int? coralItemId;
  int? coralId;
  String? coralName;
  dynamic coralPhaseId;
  dynamic coralPhaseName;
  int? indexItem;
  String? note;
  int? status;

  factory CoralItemStatus.fromJson(Map<String, dynamic> json) =>
      CoralItemStatus(
        id: json["id"],
        cellSurveyId: json["cellSurveyId"],
        coralItemId: json["coralItemId"],
        coralId: json["coralId"],
        coralName: json["coralName"],
        coralPhaseId: json["coralPhaseId"],
        coralPhaseName: json["coralPhaseName"],
        indexItem: json["indexItem"],
        note: json["note"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cellSurveyId": cellSurveyId,
        "coralItemId": coralItemId,
        "coralId": coralId,
        "coralName": coralName,
        "coralPhaseId": coralPhaseId,
        "coralPhaseName": coralPhaseName,
        "indexItem": indexItem,
        "note": note,
        "status": status,
      };
}

class Image {
  Image({
    this.id,
    this.imageUrl,
  });

  String? id;
  String? imageUrl;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imageUrl": imageUrl,
      };
}
