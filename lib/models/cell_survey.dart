// To parse this JSON data, do
//
//     final cellSurveyResponse = cellSurveyResponseFromJson(jsonString);

import 'dart:convert';

CellSurveyResponse cellSurveyResponseFromJson(String str) =>
    CellSurveyResponse.fromJson(json.decode(str));

String cellSurveyResponseToJson(CellSurveyResponse data) =>
    json.encode(data.toJson());

class CellSurveyResponse {
  CellSurveyResponse({
    this.metaData,
    this.items,
  });

  MetaData? metaData;
  List<Cell>? items;

  factory CellSurveyResponse.fromJson(Map<String, dynamic> json) =>
      CellSurveyResponse(
        metaData: MetaData.fromJson(json["metaData"]),
        items: List<Cell>.from(json["items"].map((x) => Cell.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "metaData": metaData!.toJson(),
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Cell {
  Cell({
    this.id,
    this.mediaUrl,
    this.images,
    this.note,
    this.coralCellId,
    this.coralCellMaxItem,
    this.coralCellCurrentItems,
    this.coralCellItemsStatus0,
    this.coralCellItemsStatus1,
    this.divingSurveyId,
    this.gardenReportId,
    this.diverMemberId,
    this.diverName,
    this.status,
    this.garden,
    this.coralItemStatuses,
  });

  int? id;
  String? mediaUrl;
  dynamic images;
  dynamic note;
  int? coralCellId;
  int? coralCellMaxItem;
  int? coralCellCurrentItems;
  dynamic coralCellItemsStatus0;
  dynamic coralCellItemsStatus1;
  int? divingSurveyId;
  int? gardenReportId;
  int? diverMemberId;
  String? diverName;
  int? status;
  Garden? garden;
  dynamic coralItemStatuses;

  factory Cell.fromJson(Map<String, dynamic> json) => Cell(
        id: json["id"],
        mediaUrl: json["mediaUrl"],
        images: json["images"],
        note: json["note"],
        coralCellId: json["coralCellId"],
        coralCellMaxItem: json["coralCellMaxItem"],
        coralCellCurrentItems: json["coralCellCurrentItems"],
        coralCellItemsStatus0: json["coralCellItemsStatus0"],
        coralCellItemsStatus1: json["coralCellItemsStatus1"],
        divingSurveyId: json["divingSurveyId"],
        gardenReportId: json["gardenReportId"],
        diverMemberId: json["diverMemberId"],
        diverName: json["diverName"],
        status: json["status"],
        garden: Garden.fromJson(json["garden"]),
        coralItemStatuses: json["coralItemStatuses"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mediaUrl": mediaUrl,
        "images": images,
        "note": note,
        "coralCellId": coralCellId,
        "coralCellMaxItem": coralCellMaxItem,
        "coralCellCurrentItems": coralCellCurrentItems,
        "coralCellItemsStatus0": coralCellItemsStatus0,
        "coralCellItemsStatus1": coralCellItemsStatus1,
        "divingSurveyId": divingSurveyId,
        "gardenReportId": gardenReportId,
        "diverMemberId": diverMemberId,
        "diverName": diverName,
        "status": status,
        "garden": garden!.toJson(),
        "coralItemStatuses": coralItemStatuses,
      };
}

class Garden {
  Garden({
    this.id,
    this.name,
    this.wellKnownText,
    this.address,
    this.acreage,
    this.quantityOfCells,
    this.areaId,
    this.siteId,
    this.siteName,
    this.gardenTypeId,
    this.gardenTypeName,
    this.status,
    this.coralCells,
  });

  int? id;
  String? name;
  String? wellKnownText;
  String? address;
  double? acreage;
  int? quantityOfCells;
  int? areaId;
  int? siteId;
  String? siteName;
  int? gardenTypeId;
  String? gardenTypeName;
  int? status;
  List<CoralCell>? coralCells;

  factory Garden.fromJson(Map<String, dynamic> json) => Garden(
        id: json["id"],
        name: json["name"],
        wellKnownText: json["wellKnownText"],
        address: json["address"],
        acreage: json["acreage"],
        quantityOfCells: json["quantityOfCells"],
        areaId: json["areaId"],
        siteId: json["siteId"],
        siteName: json["siteName"],
        gardenTypeId: json["gardenTypeId"],
        gardenTypeName: json["gardenTypeName"],
        status: json["status"],
        coralCells: List<CoralCell>.from(
            json["coralCells"].map((x) => CoralCell.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "wellKnownText": wellKnownText,
        "address": address,
        "acreage": acreage,
        "quantityOfCells": quantityOfCells,
        "areaId": areaId,
        "siteId": siteId,
        "siteName": siteName,
        "gardenTypeId": gardenTypeId,
        "gardenTypeName": gardenTypeName,
        "status": status,
        "coralCells": List<dynamic>.from(coralCells!.map((x) => x.toJson())),
      };
}

class CoralCell {
  CoralCell({
    this.id,
    this.acreage,
    this.maxItem,
    this.gardenId,
    this.gardenName,
    this.coralCellTypeId,
    this.coralCellTypeName,
    this.status,
    this.coralItems,
  });

  int? id;
  double? acreage;
  int? maxItem;
  int? gardenId;
  String? gardenName;
  int? coralCellTypeId;
  String? coralCellTypeName;
  int? status;
  List<dynamic>? coralItems;

  factory CoralCell.fromJson(Map<String, dynamic> json) => CoralCell(
        id: json["id"],
        acreage: json["acreage"],
        maxItem: json["maxItem"],
        gardenId: json["gardenId"],
        gardenName: json["gardenName"],
        coralCellTypeId: json["coralCellTypeId"],
        coralCellTypeName: json["coralCellTypeName"],
        status: json["status"],
        coralItems: List<dynamic>.from(json["coralItems"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "acreage": acreage,
        "maxItem": maxItem,
        "gardenId": gardenId,
        "gardenName": gardenName,
        "coralCellTypeId": coralCellTypeId,
        "coralCellTypeName": coralCellTypeName,
        "status": status,
        "coralItems": List<dynamic>.from(coralItems!.map((x) => x)),
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
