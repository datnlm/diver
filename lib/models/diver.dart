// To parse this JSON data, do
//
//     final diver = diverFromJson(jsonString);

import 'dart:convert';

Diver diverFromJson(String str) => Diver.fromJson(json.decode(str));

String diverToJson(Diver data) => json.encode(data.toJson());

class Diver {
    Diver({
        this.name,
        this.username,
        this.role,
        this.imageUrl,
        this.roleName,
        this.id,
        this.siteid,
    });

    String? name;
    String? username;
    String? role;
    String? imageUrl;
    String? roleName;
    String? id;
    String? siteid;

    factory Diver.fromJson(Map<String, dynamic> json) => Diver(
        name: json["name"],
        username: json["username"],
        role: json["role"],
        imageUrl: json["imageUrl"],
        roleName: json["roleName"],
        id: json["id"],
        siteid: json["siteid"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "role": role,
        "imageUrl": imageUrl,
        "roleName": roleName,
        "id": id,
        "siteid": siteid,
    };
}
