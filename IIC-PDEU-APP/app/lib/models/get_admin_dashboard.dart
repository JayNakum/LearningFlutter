// To parse this JSON data, do
//
//     final getAdminDashoard = getAdminDashoardFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetAdminDashoard getAdminDashoardFromJson(String str) => GetAdminDashoard.fromJson(json.decode(str));

String getAdminDashoardToJson(GetAdminDashoard data) => json.encode(data.toJson());

class GetAdminDashoard {
    GetAdminDashoard({
        required this.id,
        required this.username,
        required this.totalApplications,
        required this.newlyIncubatedStartups,
        required this.activeStartups,
        required this.startupsTillDate,
        required this.accumulatedStartupSales,
        required this.totalStartupAwards,
        required this.totalEmploymentGenerated,
        required this.iicAwards,
        required this.iicEvents,
    });

    final int id;
    final String username;
    final int totalApplications;
    final int newlyIncubatedStartups;
    final List<double> activeStartups;
    final List<double> startupsTillDate;
    final int accumulatedStartupSales;
    final int totalStartupAwards;
    final List<double> totalEmploymentGenerated;
    final List<IicAward> iicAwards;
    final List<IicEvent> iicEvents;

    factory GetAdminDashoard.fromJson(Map<String, dynamic> json) => GetAdminDashoard(
        id: json["id"],
        username: json["username"],
        totalApplications: json["total_applications"],
        newlyIncubatedStartups: json["newly_incubated_startups"],
        activeStartups: List<double>.from(json["active_startups"].map((x) => x)),
        startupsTillDate: List<double>.from(json["startups_till_date"].map((x) => x)),
        accumulatedStartupSales: json["accumulated_startup_sales"],
        totalStartupAwards: json["total_startup_awards"],
        totalEmploymentGenerated: List<double>.from(json["total_employment_generated"].map((x) => x)),
        iicAwards: List<IicAward>.from(json["iic_awards"].map((x) => IicAward.fromJson(x))),
        iicEvents: List<IicEvent>.from(json["iic_events"].map((x) => IicEvent.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "total_applications": totalApplications,
        "newly_incubated_startups": newlyIncubatedStartups,
        "active_startups": List<dynamic>.from(activeStartups.map((x) => x)),
        "startups_till_date": List<dynamic>.from(startupsTillDate.map((x) => x)),
        "accumulated_startup_sales": accumulatedStartupSales,
        "total_startup_awards": totalStartupAwards,
        "total_employment_generated": List<dynamic>.from(totalEmploymentGenerated.map((x) => x)),
        "iic_awards": List<dynamic>.from(iicAwards.map((x) => x.toJson())),
        "iic_events": List<dynamic>.from(iicEvents.map((x) => x.toJson())),
    };
}

class IicAward {
    IicAward({
        required this.name,
        required this.by,
        required this.image,
    });

    final String name;
    final String by;
    final String image;

    factory IicAward.fromJson(Map<String, dynamic> json) => IicAward(
        name: json["name"],
        by: json["by"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "by": by,
        "image": image,
    };
}

class IicEvent {
    IicEvent({
        required this.name,
        required this.date,
        required this.image,
    });

    final String name;
    final String date;
    final String image;

    factory IicEvent.fromJson(Map<String, dynamic> json) => IicEvent(
        name: json["name"],
        date: json["date"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "date": date,
        "image": image,
    };
}
