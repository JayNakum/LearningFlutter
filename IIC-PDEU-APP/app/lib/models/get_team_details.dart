// To parse this JSON data, do
//
//     final getTeamDetails = getTeamDetailsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetTeamDetails getTeamDetailsFromJson(String str) =>
    GetTeamDetails.fromJson(json.decode(str));

String getTeamDetailsToJson(GetTeamDetails data) => json.encode(data.toJson());

class GetTeamDetails {
  GetTeamDetails({
    required this.id,
    required this.username,
    required this.member1,
    required this.member2,
    required this.member3,
    required this.member4,
    required this.member5,
  });

  final int id;
  final String username;
  final Member member1;
  final Member member2;
  final Member member3;
  final Member member4;
  final Member member5;

  factory GetTeamDetails.fromJson(Map<String, dynamic> json) => GetTeamDetails(
        id: json["id"],
        username: json["username"],
        member1: Member.fromJson(json["member_1"]),
        member2: Member.fromJson(json["member_2"]),
        member3: Member.fromJson(json["member_3"]),
        member4: Member.fromJson(json["member_4"]),
        member5: Member.fromJson(json["member_5"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "member_1": member1.toJson(),
        "member_2": member2.toJson(),
        "member_3": member3.toJson(),
        "member_4": member4.toJson(),
        "member_5": member5.toJson(),
      };
}

class Member {
  Member({
    required this.name,
    required this.post,
    required this.image,
  });

  final String name;
  final String post;
  final String image;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        name: json["name"],
        post: json["post"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "post": post,
        "image": image,
      };
}
