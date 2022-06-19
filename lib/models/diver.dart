// To parse this JSON data, do
//
//     final diverResponse = diverResponseFromJson(jsonString);

import 'dart:convert';

DiverResponse diverResponseFromJson(String str) => DiverResponse.fromJson(json.decode(str));

String diverResponseToJson(DiverResponse data) => json.encode(data.toJson());

class DiverResponse {
    DiverResponse({
        this.name,
        this.username,
        this.role,
        this.imageUrl,
        this.roleName,
        this.id,
    });

    String? name;
    String? username;
    String? role;
    String? imageUrl;
    String? roleName;
    String? id;

    factory DiverResponse.fromJson(Map<String, dynamic> json) => DiverResponse(
        name: json["name"],
        username: json["username"],
        role: json["role"],
        imageUrl: json["imageUrl"],
        roleName: json["roleName"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "role": role,
        "imageUrl": imageUrl,
        "roleName": roleName,
        "id": id,
    };
}
