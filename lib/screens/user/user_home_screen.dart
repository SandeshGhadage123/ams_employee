import 'package:ams_employee/model/employee_models/EmpDashboardModel.dart';
import 'package:ams_employee/screens/user/local_widget/user_success_widget.dart';
import 'package:flutter/material.dart';
import '../../model/auth_models/auth_employee_login_post_model.dart';
import '../../repository/employee/employee_network_handler.dart';

class UserHomeScreen extends StatefulWidget {
  final AuthEmployeeLoginPostModel employeeLoginPostModel;
  const UserHomeScreen({Key? key, required this.employeeLoginPostModel}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  AuthEmployeeLoginPostModel? employeeLoginPostModel;
  EmpDashboardModel? getDashboard;

  @override
  void initState() {
    employeeLoginPostModel = widget.employeeLoginPostModel;
    super.initState();
    getEmployeeDashboard();
  }

  Future<EmpDashboardModel?> getEmployeeDashboard() async {
    return await EmployeeNetworkHandler().employeeDashboard(token: widget.employeeLoginPostModel.tokens?.access?.token ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getEmployeeDashboard(),
      builder: (context, response) {
        if (!response.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (response.hasData) {
          return UserSuccessWidget(employee: response.data, authEmployeeLoginPostModel: widget.employeeLoginPostModel,);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
