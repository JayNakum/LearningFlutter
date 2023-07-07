// To parse this JSON data, do
//
//     final getProjectDetails = getProjectDetailsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetProjectDetails getProjectDetailsFromJson(String str) => GetProjectDetails.fromJson(json.decode(str));

String getProjectDetailsToJson(GetProjectDetails data) => json.encode(data.toJson());

class GetProjectDetails {
    GetProjectDetails({
        required this.username,
        required this.projectStage,
        required this.projectSummary,
        required this.prototypeDetails,
        required this.quaterlyPlan,
    });

    final String username;
    final String projectStage;
    final String projectSummary;
    final String prototypeDetails;
    final String quaterlyPlan;

    factory GetProjectDetails.fromJson(Map<String, dynamic> json) => GetProjectDetails(
        username: json["username"],
        projectStage: json["project_stage"],
        projectSummary: json["project_summary"],
        prototypeDetails: json["prototype_details"],
        quaterlyPlan: json["quaterly_plan"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "project_stage": projectStage,
        "project_summary": projectSummary,
        "prototype_details": prototypeDetails,
        "quaterly_plan": quaterlyPlan,
    };
}
