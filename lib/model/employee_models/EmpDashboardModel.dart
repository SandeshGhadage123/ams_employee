import 'dart:convert';
/// attendance : "00h:00m"
/// recentLog : "2022-12-26T04:35:50.370Z"
/// weeklyStats : {"Monday":"00:00:44","Tuesday":"00:00:00","Wednesday":"00:00:00","Thursday":"00:00:00","Friday":"00:00:00","Saturday":"00:00:00","Sunday":"00:00:00"}
/// image : "https://bi-attendance-system.s3.ap-south-1.amazonaws.com/uploads/profile-pic/1671870210581_sandesh.png"
/// last7daysLogs : [{"type":"in","company":"63a41fceafad4045e5c2073a","employee":"63a571b06d44676789bbf58d","datetime":"2022-12-23T10:55:02.763Z","id":"63a589066d44676789bbf82c"},{"type":"out","company":"63a41fceafad4045e5c2073a","employee":"63a571b06d44676789bbf58d","datetime":"2022-12-23T10:55:05.592Z","id":"63a58909a4c997679104521d"},{"type":"in","company":"63a41fceafad4045e5c2073a","employee":"63a571b06d44676789bbf58d","datetime":"2022-12-23T10:55:07.764Z","id":"63a5890b6d44676789bbf832"},{"type":"out","company":"63a41fceafad4045e5c2073a","employee":"63a571b06d44676789bbf58d","datetime":"2022-12-23T10:55:09.338Z","id":"63a5890da4c9976791045223"},{"type":"in","company":"63a41fceafad4045e5c2073a","employee":"63a571b06d44676789bbf58d","datetime":"2022-12-23T10:55:11.933Z","id":"63a5890f6d44676789bbf838"},{"type":"out","company":"63a41fceafad4045e5c2073a","employee":"63a571b06d44676789bbf58d","datetime":"2022-12-23T10:55:13.258Z","id":"63a58911a4c9976791045229"},{"type":"in","company":"63a41fceafad4045e5c2073a","employee":"63a571b06d44676789bbf58d","datetime":"2022-12-23T10:55:15.516Z","id":"63a589136d44676789bbf83e"},{"type":"out","company":"63a41fceafad4045e5c2073a","employee":"63a571b06d44676789bbf58d","datetime":"2022-12-23T10:57:44.812Z","id":"63a589a8a4c9976791045233"},{"type":"in","company":"63a41fceafad4045e5c2073a","employee":"63a571b06d44676789bbf58d","datetime":"2022-12-23T11:00:19.479Z","id":"63a58a43a4c997679104523a"},{"type":"out","company":"63a41fceafad4045e5c2073a","employee":"63a571b06d44676789bbf58d","datetime":"2022-12-23T11:02:42.406Z","id":"63a58ad2a4c99767910452b8"},{"type":"in","company":"63a41fceafad4045e5c2073a","employee":"63a571b06d44676789bbf58d","datetime":"2022-12-26T04:35:05.733Z","id":"63a924796d44676789bbfb30"},{"type":"out","company":"63a41fceafad4045e5c2073a","employee":"63a571b06d44676789bbf58d","datetime":"2022-12-26T04:35:09.883Z","id":"63a9247da4c99767910454ee"},{"type":"in","company":"63a41fceafad4045e5c2073a","employee":"63a571b06d44676789bbf58d","datetime":"2022-12-26T04:35:50.370Z","id":"63a924a6a4c99767910454fa"}]

EmpDashboardModel empDashboardModelFromJson(String str) => EmpDashboardModel.fromJson(json.decode(str));
String empDashboardModelToJson(EmpDashboardModel data) => json.encode(data.toJson());
class EmpDashboardModel {
  EmpDashboardModel({
      String? attendance, 
      String? recentLog, 
      WeeklyStats? weeklyStats, 
      String? image, 
      List<Last7daysLogs>? last7daysLogs,}){
    _attendance = attendance;
    _recentLog = recentLog;
    _weeklyStats = weeklyStats;
    _image = image;
    _last7daysLogs = last7daysLogs;
}

  EmpDashboardModel.fromJson(dynamic json) {
    _attendance = json['attendance'];
    _recentLog = json['recentLog'];
    _weeklyStats = json['weeklyStats'] != null ? WeeklyStats.fromJson(json['weeklyStats']) : null;
    _image = json['image'];
    if (json['last7daysLogs'] != null) {
      _last7daysLogs = [];
      json['last7daysLogs'].forEach((v) {
        _last7daysLogs?.add(Last7daysLogs.fromJson(v));
      });
    }
  }
  String? _attendance;
  String? _recentLog;
  WeeklyStats? _weeklyStats;
  String? _image;
  List<Last7daysLogs>? _last7daysLogs;
EmpDashboardModel copyWith({  String? attendance,
  String? recentLog,
  WeeklyStats? weeklyStats,
  String? image,
  List<Last7daysLogs>? last7daysLogs,
}) => EmpDashboardModel(  attendance: attendance ?? _attendance,
  recentLog: recentLog ?? _recentLog,
  weeklyStats: weeklyStats ?? _weeklyStats,
  image: image ?? _image,
  last7daysLogs: last7daysLogs ?? _last7daysLogs,
);
  String? get attendance => _attendance;
  String? get recentLog => _recentLog;
  WeeklyStats? get weeklyStats => _weeklyStats;
  String? get image => _image;
  List<Last7daysLogs>? get last7daysLogs => _last7daysLogs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['attendance'] = _attendance;
    map['recentLog'] = _recentLog;
    if (_weeklyStats != null) {
      map['weeklyStats'] = _weeklyStats?.toJson();
    }
    map['image'] = _image;
    if (_last7daysLogs != null) {
      map['last7daysLogs'] = _last7daysLogs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// type : "in"
/// company : "63a41fceafad4045e5c2073a"
/// employee : "63a571b06d44676789bbf58d"
/// datetime : "2022-12-23T10:55:02.763Z"
/// id : "63a589066d44676789bbf82c"

Last7daysLogs last7daysLogsFromJson(String str) => Last7daysLogs.fromJson(json.decode(str));
String last7daysLogsToJson(Last7daysLogs data) => json.encode(data.toJson());
class Last7daysLogs {
  Last7daysLogs({
      String? type, 
      String? company, 
      String? employee, 
      String? datetime, 
      String? id,}){
    _type = type;
    _company = company;
    _employee = employee;
    _datetime = datetime;
    _id = id;
}

  Last7daysLogs.fromJson(dynamic json) {
    _type = json['type'];
    _company = json['company'];
    _employee = json['employee'];
    _datetime = json['datetime'];
    _id = json['id'];
  }
  String? _type;
  String? _company;
  String? _employee;
  String? _datetime;
  String? _id;
Last7daysLogs copyWith({  String? type,
  String? company,
  String? employee,
  String? datetime,
  String? id,
}) => Last7daysLogs(  type: type ?? _type,
  company: company ?? _company,
  employee: employee ?? _employee,
  datetime: datetime ?? _datetime,
  id: id ?? _id,
);
  String? get type => _type;
  String? get company => _company;
  String? get employee => _employee;
  String? get datetime => _datetime;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['company'] = _company;
    map['employee'] = _employee;
    map['datetime'] = _datetime;
    map['id'] = _id;
    return map;
  }

}

/// Monday : "00:00:44"
/// Tuesday : "00:00:00"
/// Wednesday : "00:00:00"
/// Thursday : "00:00:00"
/// Friday : "00:00:00"
/// Saturday : "00:00:00"
/// Sunday : "00:00:00"

WeeklyStats weeklyStatsFromJson(String str) => WeeklyStats.fromJson(json.decode(str));
String weeklyStatsToJson(WeeklyStats data) => json.encode(data.toJson());
class WeeklyStats {
  WeeklyStats({
      String? monday, 
      String? tuesday, 
      String? wednesday, 
      String? thursday, 
      String? friday, 
      String? saturday, 
      String? sunday,}){
    _monday = monday;
    _tuesday = tuesday;
    _wednesday = wednesday;
    _thursday = thursday;
    _friday = friday;
    _saturday = saturday;
    _sunday = sunday;
}

  WeeklyStats.fromJson(dynamic json) {
    _monday = json['Monday'];
    _tuesday = json['Tuesday'];
    _wednesday = json['Wednesday'];
    _thursday = json['Thursday'];
    _friday = json['Friday'];
    _saturday = json['Saturday'];
    _sunday = json['Sunday'];
  }
  String? _monday;
  String? _tuesday;
  String? _wednesday;
  String? _thursday;
  String? _friday;
  String? _saturday;
  String? _sunday;
WeeklyStats copyWith({  String? monday,
  String? tuesday,
  String? wednesday,
  String? thursday,
  String? friday,
  String? saturday,
  String? sunday,
}) => WeeklyStats(  monday: monday ?? _monday,
  tuesday: tuesday ?? _tuesday,
  wednesday: wednesday ?? _wednesday,
  thursday: thursday ?? _thursday,
  friday: friday ?? _friday,
  saturday: saturday ?? _saturday,
  sunday: sunday ?? _sunday,
);
  String? get monday => _monday;
  String? get tuesday => _tuesday;
  String? get wednesday => _wednesday;
  String? get thursday => _thursday;
  String? get friday => _friday;
  String? get saturday => _saturday;
  String? get sunday => _sunday;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Monday'] = _monday;
    map['Tuesday'] = _tuesday;
    map['Wednesday'] = _wednesday;
    map['Thursday'] = _thursday;
    map['Friday'] = _friday;
    map['Saturday'] = _saturday;
    map['Sunday'] = _sunday;
    return map;
  }

}