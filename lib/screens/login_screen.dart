// ignore_for_file: use_build_context_synchronously
import 'package:ams_employee/screens/user/user_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../model/auth_models/auth_employee_login_post_model.dart';
import '../repository/auth/auth_network_handler.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 120.h,
              ),
              Text(
                "For a personalized experience, login your account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFFfafafa),
                  fontFamily: "SFPro",
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 250.h,
              ),
              GestureDetector(
                onTap: () async {
                  AuthEmployeeLoginPostModel? authUserModel = await userSignIn();
                  if (authUserModel != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserHomeScreen(
                          employeeLoginPostModel: authUserModel,
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  width: ScreenUtil().screenWidth,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google.png',
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      const Text(
                        'Login with Google',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<AuthEmployeeLoginPostModel?> userSignIn() async {
    /// Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    /// Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthEmployeeLoginPostModel? response = await AuthNetworkHandler().employeeLogin(
      email: googleUser?.email ?? '',
      //email: "sandeshghadage1@gmail.com",
      idToken: googleAuth?.idToken ?? '',
    );

    if (response != null) {
      return response;
    }

    return null;
  }
}
