import 'package:dio/dio.dart';
import '../../constants.dart';
import '../../model/auth_models/auth_employee_login_post_model.dart';

class AuthNetworkHandler {
  final Dio dio = Dio();

  /// Get employee
  Future<AuthEmployeeLoginPostModel?> employeeLogin({
    required String email,
    required String idToken,
  }) async {
    try {
      var response = await dio.post(
        '${Constants.baseUrl}/auth/login',
        data: {
          "email": email,
          "idToken": idToken,
        },
      );
      if (response.statusCode == 200) {
        return AuthEmployeeLoginPostModel.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
