// To parse this JSON data, do
//
//     final getAdminProfile = getAdminProfileFromJson(jsonString);

import 'dart:convert';

GetAdminProfile getAdminProfileFromJson(String str) =>
    GetAdminProfile.fromJson(json.decode(str));

String getAdminProfileToJson(GetAdminProfile data) =>
    json.encode(data.toJson());

class GetAdminProfile {
  GetAdminProfile({
    required this.id,
    required this.username,
    required this.image,
    required this.position,
    required this.expertise,
    required this.otherInformation,
  });

  final int id;
  final String username;
  final String image;
  final String position;
  final String expertise;
  final String otherInformation;

  factory GetAdminProfile.fromJson(Map<String, dynamic> json) =>
      GetAdminProfile(
        id: json["id"],
        username: json["username"],
        image: json["image"],
        position: json["position"],
        expertise: json["expertise"],
        otherInformation: json["other_information"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "image": image,
        "position": position,
        "expertise": expertise,
        "other_information": otherInformation,
      };
}
