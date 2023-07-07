// To parse this JSON data, do
//
//     final getStartUpDetails = getStartUpDetailsFromJson(jsonString);

import 'dart:convert';

GetStartUpDetails getStartUpDetailsFromJson(String str) =>
    GetStartUpDetails.fromJson(json.decode(str));

String getStartUpDetailsToJson(GetStartUpDetails data) =>
    json.encode(data.toJson());

class GetStartUpDetails {
  GetStartUpDetails({
    required this.id,
    required this.username,
    required this.image,
    required this.iprDetails,
    required this.awardsAndRecognition,
    required this.employees,
    required this.finances,
    required this.mentorFeedback,
    required this.mentorMinutes,
  });

  final int id;
  final String username;
  final String image;
  final IprDetail iprDetails;
  final List<String> awardsAndRecognition;
  final int employees;
  final Map<String, double> finances;
  final String mentorFeedback;
  final String mentorMinutes;

  factory GetStartUpDetails.fromJson(Map<String, dynamic> json) =>
      GetStartUpDetails(
        id: json["id"],
        username: json["username"],
        image: json["image"],
        iprDetails: IprDetail.fromJson((json["ipr_details"] as List).first),
        awardsAndRecognition:
            List<String>.from(json["awards_and_recognition"].map((x) => x)),
        employees: json["employees"],
        finances: Map<String, double>.from((json["finances"] as List).first),
        mentorFeedback: json["mentor_feedback"],
        mentorMinutes: json["mentor_minutes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "image": image,
        "ipr_details": iprDetails,
        "awards_and_recognition":
            List<dynamic>.from(awardsAndRecognition.map((x) => x)),
        "employees": employees,
        "finances": finances,
        "mentor_feedback": mentorFeedback,
        "mentor_minutes": mentorMinutes,
      };
}

class IprDetail {
  IprDetail({
    required this.granted,
    required this.pending,
  });

  final int granted;
  final int pending;

  factory IprDetail.fromJson(Map<String, dynamic> json) => IprDetail(
        granted: json["Granted"],
        pending: json["Pending"],
      );

  Map<String, dynamic> toJson() => {
        "Granted": granted,
        "Pending": pending,
      };
}
