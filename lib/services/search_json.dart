
import 'dart:convert';

import 'package:flutter/material.dart';

class UserNumber with ChangeNotifier{
  UserNumber({
    this.id,
    this.name,
    this.surname,
    this.email,
    this.telephone,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String surname;
  String email;
  int telephone;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserNumber.fromJson(Map<String, dynamic> json) => UserNumber(
    id: json["id"],
    name: json["name"],
    surname: json["surname"],
    email: json["email"],
    telephone: json["telephone"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "surname": surname,
    "email": email,
    "telephone": telephone,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
