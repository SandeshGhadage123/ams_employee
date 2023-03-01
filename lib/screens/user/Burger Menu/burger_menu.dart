import 'package:ams_employee/model/auth_models/auth_employee_login_post_model.dart';
import 'package:ams_employee/screens/user/Burger%20Menu/Local%20Widget/all_doc_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BurgerMenu extends StatefulWidget {
  AuthEmployeeLoginPostModel? authEmployeeLoginPostModel;
  BurgerMenu({Key? key, required this.authEmployeeLoginPostModel}) : super(key: key);

  @override
  State<BurgerMenu> createState() => _BurgerMenuState();
}

class _BurgerMenuState extends State<BurgerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color(0xFF26252C),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 30,),
              ListTile(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllDocPage(authEmployeeLoginPostModel: widget.authEmployeeLoginPostModel,),
                    ),
                  );
                },
                title: Text(
                  "Add Documents",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "SFPro",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Request Card",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "SFPro",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Setting",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "SFPro",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Log Out",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "SFPro",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
