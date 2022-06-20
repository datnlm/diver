// To parse this JSON data, do
//
//     final diverResponse = diverResponseFromJson(jsonString);

import 'dart:convert';

class Diver {
  Diver({
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
}
