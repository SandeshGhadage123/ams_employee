import 'dart:io';

import 'package:ams_employee/model/auth_models/auth_employee_login_post_model.dart';
import 'package:ams_employee/model/document_model/Doc_upload_model.dart';
import 'package:ams_employee/repository/employee/employee_network_handler.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllDocPage extends StatefulWidget {
  AuthEmployeeLoginPostModel? authEmployeeLoginPostModel;
  AllDocPage({Key? key, required this.authEmployeeLoginPostModel}) : super(key: key);

  @override
  State<AllDocPage> createState() => _AllDocPageState();
}

class _AllDocPageState extends State<AllDocPage> {
  bool isUploaded = false;
  Root? docUploadModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Documents".toUpperCase()),
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
          fontSize: 25.sp,
          fontFamily: "SFPro",
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10,),
          DocWidget(Icons.verified_user_outlined, "Aadhar", docUploadModel?.isAdharUploaded ?? false ),
          const SizedBox(height: 10,),
          DocWidget(Icons.person_outlined, "Pan Card", docUploadModel?.isPanUploaded ?? true),
          const SizedBox(height: 10,),
          DocWidget(Icons.drive_eta_sharp, "Driving License", isUploaded),
          const SizedBox(height: 10,),
          DocWidget(Icons.how_to_vote_outlined, "Election ID Card", isUploaded),
          const SizedBox(height: 10,),

      GestureDetector(
        onTap: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 80.h,
            decoration: BoxDecoration(
              color: const Color(0xFF26252C),
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(height: 23,width: 23,
                    child: Image.asset('assets/images/passport.png',color: Colors.white,),),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Passport",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontFamily: "SFPro",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.done_outline,
                  color: isUploaded ? Colors.green : Colors.white.withOpacity(0.5),
                )
              ],
            ),
          ),
        ),
      ),




        ],
      ),
    );
  }

  Widget DocWidget(IconData icon, String DocName, bool isUploaded) {
    return GestureDetector(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();
        if (result != null) {
          File file = File(result.files.single.path ?? "");
          EmployeeNetworkHandler().addDocument(image: file, docType: DocName, token: widget.authEmployeeLoginPostModel?.tokens?.access?.token ?? "");
          setState(() {
            isUploaded = true;
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 80.h,
          decoration: BoxDecoration(
            color: const Color(0xFF26252C),
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, color: Colors.white,),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DocName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontFamily: "SFPro",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.done_outline,
                color: isUploaded ? Colors.green : Colors.white.withOpacity(0.5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
