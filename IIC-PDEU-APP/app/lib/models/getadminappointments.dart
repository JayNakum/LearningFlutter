// To parse this JSON data, do
//
//     final getAdminAppointments = getAdminAppointmentsFromJson(jsonString);

import 'dart:convert';

GetAdminAppointments getAdminAppointmentsFromJson(String str) =>
    GetAdminAppointments.fromJson(json.decode(str));

String getAdminAppointmentsToJson(GetAdminAppointments data) =>
    json.encode(data.toJson());

class GetAdminAppointments {
  GetAdminAppointments({
    required this.id,
    required this.username,
    required this.adminAppointmentDate,
    required this.adminAppointmentWith,
  });

  final int id;
  final String username;
  final DateTime adminAppointmentDate;
  final String adminAppointmentWith;

  factory GetAdminAppointments.fromJson(Map<String, dynamic> json) =>
      GetAdminAppointments(
        id: json["id"],
        username: json["username"],
        adminAppointmentDate: DateTime.parse(json["admin_appointment_date"]),
        adminAppointmentWith: json["admin_appointment_with"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "admin_appointment_date": adminAppointmentDate.toIso8601String(),
        "admin_appointment_with": adminAppointmentWith,
      };
}
