// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

EmployeeDashboardModel EmployeeDashboardModelFromJson(String str) => EmployeeDashboardModel.fromJson(json.decode(str));

String EmployeeDashboardModelToJson(EmployeeDashboardModel data) => json.encode(data.toJson());

class EmployeeDashboardModel {
  EmployeeDashboardModel({
    required this.attendance,
    required this.recentLog,
    required this.last7Days,
  });

  String attendance;
  String recentLog;
  Last7Days last7Days;

  factory EmployeeDashboardModel.fromJson(Map<String, dynamic> json) => EmployeeDashboardModel(
    attendance: json["attendance"],
    recentLog: json["recentLog"],
    last7Days: Last7Days.fromJson(json["last7days"]),
  );

  Map<String, dynamic> toJson() => {
    "attendance": attendance,
    "recentLog": recentLog,
    "last7days": last7Days.toJson(),
  };
}

class Last7Days {
  Last7Days({
    required this.the20221203,
    required this.the20221206,
  });

  String the20221203;
  String the20221206;

  factory Last7Days.fromJson(Map<String, dynamic> json) => Last7Days(
    the20221203: json["2022-12-03"],
    the20221206: json["2022-12-06"],
  );

  Map<String, dynamic> toJson() => {
    "2022-12-03": the20221203,
    "2022-12-06": the20221206,
  };
}
