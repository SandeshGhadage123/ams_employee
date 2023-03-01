/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Root {
  bool? isAdharUploaded;
  bool? isPanUploaded;

  Root({this.isAdharUploaded, this.isPanUploaded});

  Root.fromJson(Map<String, dynamic> json) {
    isAdharUploaded = json['isAdharUploaded'];
    isPanUploaded = json['isPanUploaded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isAdharUploaded'] = isAdharUploaded;
    data['isPanUploaded'] = isPanUploaded;
    return data;
  }
}