// To parse required this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
    Profile({
        required this.data,
    });

    Data data;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.id,
        required this.username,
        required this.password,
        required this.phone,
        required this.alamat,
         this.photoProfile,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String username;
    String password;
    int phone;
    String alamat;
    String? photoProfile;
    DateTime createdAt;
    DateTime updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        phone: json["phone"],
        alamat: json["alamat"],
        photoProfile: json["photo_profile"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "phone": phone,
        "alamat": alamat,
        "photo_profile": photoProfile,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
