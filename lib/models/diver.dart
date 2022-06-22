// To parse this JSON data, do
//
//     final diver = diverFromJson(jsonString);

import 'dart:convert';

Diver diverFromJson(String str) => Diver.fromJson(json.decode(str));

String diverToJson(Diver data) => json.encode(data.toJson());

class Diver {
  Diver({
    this.id,
    this.imageUrl,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.status,
  });

  int? id;
  String? imageUrl;
  String? name;
  String? phone;
  String? email;
  String? address;
  int? status;

  factory Diver.fromJson(Map<String, dynamic> json) => Diver(
        id: json["id"],
        imageUrl: json["imageUrl"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        address: json["address"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imageUrl": imageUrl,
        "name": name,
        "phone": phone,
        "email": email,
        "address": address,
        "status": status,
      };
}
