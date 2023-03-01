import 'dart:convert';
/// documents : {"docType":"aadhar","image":"https://bi-attendance-system.s3.ap-south-1.amazonaws.com/uploads/documents/1676362794958_WhatsApp%20Image%202023-02-10%20at%208.38.34%20PM.jpeg","employee":"63a571b06d44676789bbf58d","id":"63eb442b942794877095eee0"}

AddDocModel addDocModelFromJson(String str) => AddDocModel.fromJson(json.decode(str));
String addDocModelToJson(AddDocModel data) => json.encode(data.toJson());
class AddDocModel {
  AddDocModel({
      Documents? documents,}){
    _documents = documents;
}

  AddDocModel.fromJson(dynamic json) {
    _documents = json['documents'] != null ? Documents.fromJson(json['documents']) : null;
  }
  Documents? _documents;
AddDocModel copyWith({  Documents? documents,
}) => AddDocModel(  documents: documents ?? _documents,
);
  Documents? get documents => _documents;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_documents != null) {
      map['documents'] = _documents?.toJson();
    }
    return map;
  }

}

/// docType : "aadhar"
/// image : "https://bi-attendance-system.s3.ap-south-1.amazonaws.com/uploads/documents/1676362794958_WhatsApp%20Image%202023-02-10%20at%208.38.34%20PM.jpeg"
/// employee : "63a571b06d44676789bbf58d"
/// id : "63eb442b942794877095eee0"

Documents documentsFromJson(String str) => Documents.fromJson(json.decode(str));
String documentsToJson(Documents data) => json.encode(data.toJson());
class Documents {
  Documents({
      String? docType, 
      String? image, 
      String? employee, 
      String? id,}){
    _docType = docType;
    _image = image;
    _employee = employee;
    _id = id;
}

  Documents.fromJson(dynamic json) {
    _docType = json['docType'];
    _image = json['image'];
    _employee = json['employee'];
    _id = json['id'];
  }
  String? _docType;
  String? _image;
  String? _employee;
  String? _id;
Documents copyWith({  String? docType,
  String? image,
  String? employee,
  String? id,
}) => Documents(  docType: docType ?? _docType,
  image: image ?? _image,
  employee: employee ?? _employee,
  id: id ?? _id,
);
  String? get docType => _docType;
  String? get image => _image;
  String? get employee => _employee;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['docType'] = _docType;
    map['image'] = _image;
    map['employee'] = _employee;
    map['id'] = _id;
    return map;
  }

}