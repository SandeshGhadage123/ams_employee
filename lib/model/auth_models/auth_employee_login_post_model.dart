import 'dart:convert';
/// employee : {"role":"employee","email":"anand5@bi.com","cardId":"CARD0003","name":"Anand Odedara 3","mobile":"9876543210","company":"638213d02b2dd86a6f74a6ce","id":"638216c72b2dd86a6f74a6e0"}
/// tokens : {"access":{"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzgyMTZjNzJiMmRkODZhNmY3NGE2ZTAiLCJpYXQiOjE2Njk0Njk5NzgsImV4cCI6MTY2OTQ3MTc3OCwidHlwZSI6ImFjY2VzcyJ9.FnFgOGHICIJnwselY6JKCy0-nZq8FOryPoCrvoC6pz4","expires":"2022-11-26T14:09:38.075Z"},"refresh":{"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzgyMTZjNzJiMmRkODZhNmY3NGE2ZTAiLCJpYXQiOjE2Njk0Njk5NzgsImV4cCI6MTY3MjA2MTk3OCwidHlwZSI6InJlZnJlc2gifQ.lwjb8CjHWBvL4O9LqfHVPUN6X8p4J6JJbwfSbgBEnhU","expires":"2022-12-26T13:39:38.075Z"}}

AuthEmployeeLoginPostModel authEmployeeLoginPostModelFromJson(String str) => AuthEmployeeLoginPostModel.fromJson(json.decode(str));
String authEmployeeLoginPostModelToJson(AuthEmployeeLoginPostModel data) => json.encode(data.toJson());
class AuthEmployeeLoginPostModel {
  AuthEmployeeLoginPostModel({
    Employee? employee,
    Tokens? tokens,}){
    _employee = employee;
    _tokens = tokens;
  }

  AuthEmployeeLoginPostModel.fromJson(dynamic json) {
    _employee = json['employee'] != null ? Employee.fromJson(json['employee']) : null;
    _tokens = json['tokens'] != null ? Tokens.fromJson(json['tokens']) : null;
  }
  Employee? _employee;
  Tokens? _tokens;
  AuthEmployeeLoginPostModel copyWith({  Employee? employee,
    Tokens? tokens,
  }) => AuthEmployeeLoginPostModel(  employee: employee ?? _employee,
    tokens: tokens ?? _tokens,
  );
  Employee? get employee => _employee;
  Tokens? get tokens => _tokens;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_employee != null) {
      map['employee'] = _employee?.toJson();
    }
    if (_tokens != null) {
      map['tokens'] = _tokens?.toJson();
    }
    return map;
  }

}

/// access : {"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzgyMTZjNzJiMmRkODZhNmY3NGE2ZTAiLCJpYXQiOjE2Njk0Njk5NzgsImV4cCI6MTY2OTQ3MTc3OCwidHlwZSI6ImFjY2VzcyJ9.FnFgOGHICIJnwselY6JKCy0-nZq8FOryPoCrvoC6pz4","expires":"2022-11-26T14:09:38.075Z"}
/// refresh : {"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzgyMTZjNzJiMmRkODZhNmY3NGE2ZTAiLCJpYXQiOjE2Njk0Njk5NzgsImV4cCI6MTY3MjA2MTk3OCwidHlwZSI6InJlZnJlc2gifQ.lwjb8CjHWBvL4O9LqfHVPUN6X8p4J6JJbwfSbgBEnhU","expires":"2022-12-26T13:39:38.075Z"}

Tokens tokensFromJson(String str) => Tokens.fromJson(json.decode(str));
String tokensToJson(Tokens data) => json.encode(data.toJson());
class Tokens {
  Tokens({
    Access? access,
    Refresh? refresh,}){
    _access = access;
    _refresh = refresh;
  }

  Tokens.fromJson(dynamic json) {
    _access = json['access'] != null ? Access.fromJson(json['access']) : null;
    _refresh = json['refresh'] != null ? Refresh.fromJson(json['refresh']) : null;
  }
  Access? _access;
  Refresh? _refresh;
  Tokens copyWith({  Access? access,
    Refresh? refresh,
  }) => Tokens(  access: access ?? _access,
    refresh: refresh ?? _refresh,
  );
  Access? get access => _access;
  Refresh? get refresh => _refresh;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_access != null) {
      map['access'] = _access?.toJson();
    }
    if (_refresh != null) {
      map['refresh'] = _refresh?.toJson();
    }
    return map;
  }

}

/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzgyMTZjNzJiMmRkODZhNmY3NGE2ZTAiLCJpYXQiOjE2Njk0Njk5NzgsImV4cCI6MTY3MjA2MTk3OCwidHlwZSI6InJlZnJlc2gifQ.lwjb8CjHWBvL4O9LqfHVPUN6X8p4J6JJbwfSbgBEnhU"
/// expires : "2022-12-26T13:39:38.075Z"

Refresh refreshFromJson(String str) => Refresh.fromJson(json.decode(str));
String refreshToJson(Refresh data) => json.encode(data.toJson());
class Refresh {
  Refresh({
    String? token,
    String? expires,}){
    _token = token;
    _expires = expires;
  }

  Refresh.fromJson(dynamic json) {
    _token = json['token'];
    _expires = json['expires'];
  }
  String? _token;
  String? _expires;
  Refresh copyWith({  String? token,
    String? expires,
  }) => Refresh(  token: token ?? _token,
    expires: expires ?? _expires,
  );
  String? get token => _token;
  String? get expires => _expires;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['expires'] = _expires;
    return map;
  }

}

/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzgyMTZjNzJiMmRkODZhNmY3NGE2ZTAiLCJpYXQiOjE2Njk0Njk5NzgsImV4cCI6MTY2OTQ3MTc3OCwidHlwZSI6ImFjY2VzcyJ9.FnFgOGHICIJnwselY6JKCy0-nZq8FOryPoCrvoC6pz4"
/// expires : "2022-11-26T14:09:38.075Z"

Access accessFromJson(String str) => Access.fromJson(json.decode(str));
String accessToJson(Access data) => json.encode(data.toJson());
class Access {
  Access({
    String? token,
    String? expires,}){
    _token = token;
    _expires = expires;
  }

  Access.fromJson(dynamic json) {
    _token = json['token'];
    _expires = json['expires'];
  }
  String? _token;
  String? _expires;
  Access copyWith({  String? token,
    String? expires,
  }) => Access(  token: token ?? _token,
    expires: expires ?? _expires,
  );
  String? get token => _token;
  String? get expires => _expires;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['expires'] = _expires;
    return map;
  }

}

/// role : "employee"
/// email : "anand5@bi.com"
/// cardId : "CARD0003"
/// name : "Anand Odedara 3"
/// mobile : "9876543210"
/// company : "638213d02b2dd86a6f74a6ce"
/// id : "638216c72b2dd86a6f74a6e0"

Employee employeeFromJson(String str) => Employee.fromJson(json.decode(str));
String employeeToJson(Employee data) => json.encode(data.toJson());
class Employee {
  Employee({
    String? role,
    String? email,
    String? cardId,
    String? name,
    String? mobile,
    String? company,
    String? id,}){
    _role = role;
    _email = email;
    _cardId = cardId;
    _name = name;
    _mobile = mobile;
    _company = company;
    _id = id;
  }

  Employee.fromJson(dynamic json) {
    _role = json['role'];
    _email = json['email'];
    _cardId = json['cardId'];
    _name = json['name'];
    _mobile = json['mobile'];
    _company = json['company'];
    _id = json['id'];
  }
  String? _role;
  String? _email;
  String? _cardId;
  String? _name;
  String? _mobile;
  String? _company;
  String? _id;
  Employee copyWith({  String? role,
    String? email,
    String? cardId,
    String? name,
    String? mobile,
    String? company,
    String? id,
  }) => Employee(  role: role ?? _role,
    email: email ?? _email,
    cardId: cardId ?? _cardId,
    name: name ?? _name,
    mobile: mobile ?? _mobile,
    company: company ?? _company,
    id: id ?? _id,
  );
  String? get role => _role;
  String? get email => _email;
  String? get cardId => _cardId;
  String? get name => _name;
  String? get mobile => _mobile;
  String? get company => _company;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role'] = _role;
    map['email'] = _email;
    map['cardId'] = _cardId;
    map['name'] = _name;
    map['mobile'] = _mobile;
    map['company'] = _company;
    map['id'] = _id;
    return map;
  }

}