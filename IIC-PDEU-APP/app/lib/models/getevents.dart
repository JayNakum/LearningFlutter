// To parse this JSON data, do
//
//     final getEvents = getEventsFromJson(jsonString);
import 'dart:convert';

GetEvents getEventsFromJson(String str) => GetEvents.fromJson(json.decode(str));

String getEventsToJson(GetEvents data) => json.encode(data.toJson());

class GetEvents {
  GetEvents({
    required this.id,
    required this.createdBy,
    required this.eventName,
    required this.eventDate,
    required this.eventBrief,
  });

  final int id;
  final String createdBy;
  final String eventName;
  final DateTime eventDate;
  final String eventBrief;

  factory GetEvents.fromJson(Map<String, dynamic> json) => GetEvents(
        id: json["id"],
        createdBy: json["created_by"],
        eventName: json["event_name"],
        eventDate: DateTime.parse(json["event_date"]),
        eventBrief: json["event_brief"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy,
        "event_name": eventName,
        "event_date": eventDate.toIso8601String(),
        "event_brief": eventBrief,
      };
}
