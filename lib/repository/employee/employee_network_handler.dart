import 'dart:io';

import 'package:ams_employee/model/document_model/add_doc_model.dart';
import 'package:ams_employee/model/employee_models/EmpDashboardModel.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import '../../constants.dart';

class EmployeeNetworkHandler {
  final Dio dio = Dio();

  Future<EmpDashboardModel?> employeeDashboard({required String token}) async {
    var response = await dio.get(
      "${Constants.baseUrl}/employees/dashboard",
      options: Options(
        headers: {"Authorization": "Bearer ${token ?? ''}"},
      ),
    );
    if (response.statusCode == 200) {
      EmpDashboardModel model = EmpDashboardModel.fromJson(response.data);
      return model;
    }
    return null;
  }


  /// Add Document
  Future<AddDocModel?> addDocument({
    required File image,
    required String docType,
    required String token,
  }) async {
    try {
      String fileName = image.path.split('/').last ?? '';

      FormData formData = FormData.fromMap({
        "docType": docType,
        "image":
        await MultipartFile.fromFile(image.path ?? "", filename: fileName),
      });

      var response = await dio.post(
        '${Constants.baseUrl}/documents',
        data: formData,
        options: Options(
          headers: {"Authorization": "Bearer ${token ?? ''}"},
        ),
      );
      if (response.statusCode == 200) {
        return AddDocModel.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
