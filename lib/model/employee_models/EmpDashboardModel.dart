/// attendance : "00:00"
/// recentLog : "13:02"
/// last7days : {"":""}
/// image : "https://bi-attendance-system.s3.ap-south-1.amazonaws.com/uploads/profile-pic/1670417134725_6%20Ashutosh.jpg"
/// last7daysLogs : [{"type":"in","company":"638ac973d6368746db137e4d","employee":"63908af0cd9fb245f6d2e6b8","datetime":"2022-12-07T13:02:42.844Z","id":"63908ef2bd7a21475964bbb7"},{"type":"out","company":"638ac973d6368746db137e4d","employee":"63908af0cd9fb245f6d2e6b8","datetime":"2022-12-07T13:02:50.306Z","id":"63908efac1296e4761d57e88"}]

class EmpDashboardModel {
  EmpDashboardModel({
    String? attendance,
    String? recentLog,
    Map<String, dynamic>? last7days,
    String? image,
    List<Last7daysLogs>? last7daysLogs,
  }) {
    _attendance = attendance;
    _recentLog = recentLog;
    _last7days = last7days;
    _image = image;
    _last7daysLogs = last7daysLogs;
  }

  EmpDashboardModel.fromJson(dynamic json) {
    _attendance = json['attendance'];
    _recentLog = json['recentLog'];
    _last7days = json['last7days'] != null ? last7days : null;
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
  Map<String, dynamic>? _last7days;
  String? _image;
  List<Last7daysLogs>? _last7daysLogs;

  String? get attendance => _attendance;
  String? get recentLog => _recentLog;
  Map<String, dynamic>? get last7days => _last7days;
  String? get image => _image;
  List<Last7daysLogs>? get last7daysLogs => _last7daysLogs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['attendance'] = _attendance;
    map['recentLog'] = _recentLog;
    if (_last7days != null) {
      map['last7days'] = _last7days;
    }
    map['image'] = _image;
    if (_last7daysLogs != null) {
      map['last7daysLogs'] = _last7daysLogs?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// type : "in"
/// company : "638ac973d6368746db137e4d"
/// employee : "63908af0cd9fb245f6d2e6b8"
/// datetime : "2022-12-07T13:02:42.844Z"
/// id : "63908ef2bd7a21475964bbb7"

class Last7daysLogs {
  Last7daysLogs({
    String? type,
    String? company,
    String? employee,
    String? datetime,
    String? id,
  }) {
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
