import 'package:ams_employee/model/employee_models/EmpDashboardModel.dart';
import 'package:dio/dio.dart';
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
}
