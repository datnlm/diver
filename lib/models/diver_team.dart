// To parse this JSON data, do
//
//     final diverTeamResponse = diverTeamResponseFromJson(jsonString);

import 'dart:convert';

DiverTeam diverTeamResponseFromJson(String str) =>
    DiverTeam.fromJson(json.decode(str));

String diverTeamResponseToJson(DiverTeam data) => json.encode(data.toJson());

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
  DateTime? createTime;
  String? name;
  int? number;
  int? status;
  List<Diver>? divers;
  List<Area>? areas;

  factory DiverTeam.fromJson(Map<String, dynamic> json) => DiverTeam(
        id: json["id"],
        createTime: DateTime.parse(json["createTime"]),
        name: json["name"],
        number: json["number"],
        status: json["status"],
        divers: List<Diver>.from(json["divers"].map((x) => Diver.fromJson(x))),
        areas: List<Area>.from(json["areas"].map((x) => Area.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createTime": createTime!.toIso8601String(),
        "name": name,
        "number": number,
        "status": status,
        "divers": List<dynamic>.from(divers!.map((x) => x.toJson())),
        "areas": List<dynamic>.from(areas!.map((x) => x.toJson())),
      };
}

class Area {
  Area({
    this.id,
    this.name,
    this.wellKnownText,
    this.address,
    this.corals,
    this.diverTeams,
    this.technicians,
  });

  int? id;
  String? name;
  String? wellKnownText;
  String? address;
  dynamic corals;
  dynamic diverTeams;
  dynamic technicians;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        name: json["name"],
        wellKnownText: json["wellKnownText"],
        address: json["address"],
        corals: json["corals"],
        diverTeams: json["diverTeams"],
        technicians: json["technicians"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "wellKnownText": wellKnownText,
        "address": address,
        "corals": corals,
        "diverTeams": diverTeams,
        "technicians": technicians,
      };
}

class Diver {
  Diver({
    this.id,
    this.imageUrl,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.deviceId,
    this.status,
  });

  int? id;
  String? imageUrl;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? deviceId;
  int? status;

  factory Diver.fromJson(Map<String, dynamic> json) => Diver(
        id: json["id"],
        imageUrl: json["imageUrl"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        address: json["address"],
        deviceId: json["deviceId"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imageUrl": imageUrl,
        "name": name,
        "phone": phone,
        "email": email,
        "address": address,
        "deviceId": deviceId,
        "status": status,
      };
}
