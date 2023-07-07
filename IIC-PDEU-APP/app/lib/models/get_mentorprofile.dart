// To parse this JSON data, do
//
//     final getMentorDetails = getMentorDetailsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetMentorDetails getMentorDetailsFromJson(String str) =>
    GetMentorDetails.fromJson(json.decode(str));

String getMentorDetailsToJson(GetMentorDetails data) =>
    json.encode(data.toJson());

class GetMentorDetails {
  GetMentorDetails({
    required this.id,
    required this.username,
    required this.email,
    required this.number,
    required this.image,
    required this.position,
    required this.experties,
    required this.otherInformation,
  });

  final int id;
  final String username;
  final String email;
  final String number;
  final String image;
  final String position;
  final String experties;
  final String otherInformation;

  factory GetMentorDetails.fromJson(Map<String, dynamic> json) =>
      GetMentorDetails(
        id: json["id"],
        username: json["username"],
        email: json["mail"],
        number: '+${json["number"]}',
        image: json["image"],
        position: json["position"],
        experties: json["experties"],
        otherInformation: json["other_information"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "image": image,
        "number": number,
        "position": position,
        "experties": experties,
        "other_information": otherInformation,
      };
}
