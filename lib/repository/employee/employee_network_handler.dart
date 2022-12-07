import 'package:dio/dio.dart';
import '../../constants.dart';
import '../../model/employee_models/employee_dashboard_model.dart';

class EmployeeNetworkHandler {
  final Dio dio = Dio();

  Future<EmployeeDashboardModel?> employeeDashboard({required String token}) async {
    var response = await dio.get(
      "${Constants.baseUrl}/employees/dashboard", options: Options(
      headers: {"Authorization": "Bearer ${token ?? ''}"},
    ),);
    if (response.statusCode == 200) {
      EmployeeDashboardModel model =
      EmployeeDashboardModel.fromJson(response.data);
      return model;
    }
    return null;
  }
}
