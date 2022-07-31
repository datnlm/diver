// To parse this JSON data, do
//
//     final diverTeamResponse = diverTeamResponseFromJson(jsonString);

import 'dart:convert';

DiverTeamResponse diverTeamResponseFromJson(String str) =>
    DiverTeamResponse.fromJson(json.decode(str));

String diverTeamResponseToJson(DiverTeamResponse data) =>
    json.encode(data.toJson());

class DiverTeamResponse {
  DiverTeamResponse({
    this.metaData,
    this.items,
  });

  MetaData? metaData;
  List<DiverTeam>? items;

  factory DiverTeamResponse.fromJson(Map<String, dynamic> json) =>
      DiverTeamResponse(
        metaData: MetaData.fromJson(json["metaData"]),
        items: List<DiverTeam>.from(
            json["items"].map((x) => DiverTeam.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "metaData": metaData!.toJson(),
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class DiverTeam {
  DiverTeam({
    this.id,
    this.createTime,
    this.name,
    this.number,
    this.status,
    this.divers,
    this.areas,
  });

  int? id;
  dynamic createTime;
  String? name;
  int? number;
  int? status;
  dynamic divers;
  dynamic areas;

  factory DiverTeam.fromJson(Map<String, dynamic> json) => DiverTeam(
        id: json["id"],
        createTime: json["createTime"],
        name: json["name"],
        number: json["number"],
        status: json["status"],
        divers: json["divers"],
        areas: json["areas"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createTime": createTime,
        "name": name,
        "number": number,
        "status": status,
        "divers": divers,
        "areas": areas,
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
