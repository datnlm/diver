// To parse this JSON data, do
//
//     final cellSurveyResponse = cellSurveyResponseFromJson(jsonString);

import 'dart:convert';

CellSurveyResponse cellSurveyResponseFromJson(String str) => CellSurveyResponse.fromJson(json.decode(str));

String cellSurveyResponseToJson(CellSurveyResponse data) => json.encode(data.toJson());

class CellSurveyResponse {
    CellSurveyResponse({
        this.metaData,
        this.items,
    });

    MetaData? metaData;
    List<Cell>? items;

    factory CellSurveyResponse.fromJson(Map<String, dynamic> json) => CellSurveyResponse(
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
        this.divingSurveyId,
        this.gardenReportId,
        this.diverMemberId,
        this.status,
        this.coralItemStatuses,
    });

    int? id;
    String? mediaUrl;
    dynamic images;
    dynamic note;
    int? coralCellId;
    int? divingSurveyId;
    dynamic gardenReportId;
    int? diverMemberId;
    int? status;
    dynamic coralItemStatuses;

    factory Cell.fromJson(Map<String, dynamic> json) => Cell(
        id: json["id"],
        mediaUrl: json["mediaUrl"],
        images: json["images"],
        note: json["note"],
        coralCellId: json["coralCellId"],
        divingSurveyId: json["divingSurveyId"],
        gardenReportId: json["gardenReportId"],
        diverMemberId: json["diverMemberId"],
        status: json["status"],
        coralItemStatuses: json["coralItemStatuses"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "mediaUrl": mediaUrl,
        "images": images,
        "note": note,
        "coralCellId": coralCellId,
        "divingSurveyId": divingSurveyId,
        "gardenReportId": gardenReportId,
        "diverMemberId": diverMemberId,
        "status": status,
        "coralItemStatuses": coralItemStatuses,
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
