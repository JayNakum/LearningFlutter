// To parse this JSON data, do
//
//     final getMentorAppointments = getMentorAppointmentsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<GetMentorAppointments> getMentorAppointmentsFromJson(String str) => List<GetMentorAppointments>.from(json.decode(str).map((x) => GetMentorAppointments.fromJson(x)));

String getMentorAppointmentsToJson(List<GetMentorAppointments> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetMentorAppointments {
    GetMentorAppointments({
        required this.id,
        required this.username,
        required this.appointmentDate,
        required this.appointmentWith,
    });

    final int id;
    final String username;
    final DateTime appointmentDate;
    final String appointmentWith;

    factory GetMentorAppointments.fromJson(Map<String, dynamic> json) => GetMentorAppointments(
        id: json["id"],
        username: json["username"],
        appointmentDate: DateTime.parse(json["appointment_date"]),
        appointmentWith: json["appointment_with"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "appointment_date": appointmentDate.toIso8601String(),
        "appointment_with": appointmentWith,
    };
}
