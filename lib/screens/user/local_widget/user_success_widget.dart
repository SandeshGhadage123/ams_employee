import 'package:ams_employee/model/auth_models/auth_employee_login_post_model.dart';
import 'package:ams_employee/model/employee_models/EmpDashboardModel.dart';
import 'package:ams_employee/screens/card_anim.dart';
import 'package:ams_employee/screens/user/Burger%20Menu/burger_menu.dart';
import 'package:ams_employee/util/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../contract_linking.dart';

class UserSuccessWidget extends StatefulWidget {
  AuthEmployeeLoginPostModel? authEmployeeLoginPostModel;
  final EmpDashboardModel? employee;

  UserSuccessWidget({Key? key, required this.employee, required this.authEmployeeLoginPostModel}) : super(key: key);

  @override
  State<UserSuccessWidget> createState() => _UserSuccessWidgetState();
}

class _UserSuccessWidgetState extends State<UserSuccessWidget> {
  final List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri"];
  int selectedDay = 7;
  bool showMore = true;

  DateTime today = DateTime.now();

  @override
  void initState() {
    selectDay();
    super.initState();
  }

  void selectDay() {
    final moonLanding = DateTime.parse("$today");
    final x = moonLanding.weekday;
    final y = DateTime.monday;
    if (moonLanding.weekday == 1) {
      selectedDay = 0;
    }
    if (moonLanding.weekday == 2) {
      selectedDay = 1;
    }
    if (moonLanding.weekday == 3) {
      selectedDay = 2;
    }
    if (moonLanding.weekday == 4) {
      selectedDay = 3;
    }
    if (moonLanding.weekday == 5) {
      selectedDay = 4;
    }
  }

  String thisMonth = DateFormat.MMM().format(DateTime.now());
  List dailyMinutes = [];


  // Future<void> _launchUrl() async {
  //   if (await canLaunchUrl(_url)) {
  //     await launchUrl(_url);
  //   } else {
  //     throw Exception('Could not launch $_url');
  //   }
  // }

  // void xyz() async {
  //   String filePath = '/path/to/file';
  //   final result = await ipfs.uploadToIpfs(filePath);
  //   final cid = result['value']['cid'];
  //   print(cid);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      endDrawer: BurgerMenu(authEmployeeLoginPostModel: widget.authEmployeeLoginPostModel,),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25.w,
              vertical: 25.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DelayedDisplay(
                  delay: Duration(milliseconds: 200),
                  child: Text(
                    "Welcome,",
                    style: TextStyle(
                      color: const Color(0xFFfafafa),
                      fontFamily: "SFPro",
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 500),
                  slidingCurve: Curves.easeIn,
                  child: CardAnim(
                    img: widget.employee?.image ?? '',
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 1200),
                  child: Row(
                    children: [
                      Container(
                        height: 225.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFF26252C),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 20.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Attendance",
                              style: TextStyle(
                                color: const Color(0xFF979797),
                                fontFamily: "SFPro",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              (widget.employee?.attendance ?? '').toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "SFPro",
                                fontSize: 40.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              //height: 102.h,
                              width: 250.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFF26252C),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 20.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Recent Log",
                                    style: TextStyle(
                                      color: const Color(0xFF979797),
                                      fontFamily: "SFPro",
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    DateUtil.getTime(
                                        widget.employee?.recentLog ?? ''),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "SFPro",
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                              height: 102.h,
                              width: 250.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFF26252C),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 20.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Accuracy",
                                    style: TextStyle(
                                      color: const Color(0xFF979797),
                                      fontFamily: "SFPro",
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // set up the button
                                          Widget okButton = TextButton(
                                            child: Text("OK"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          );

                                          // set up the AlertDialog
                                          AlertDialog alert = AlertDialog(
                                            title: Text("Accuracy"),
                                            content: Text(
                                                "Please check after 1 month."),
                                            actions: [
                                              okButton,
                                            ],
                                          );

                                          // show the dialog
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return alert;
                                            },
                                          );
                                        },
                                        child: const Icon(
                                          Icons.info_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "73%",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "SFPro",
                                            fontSize: 28.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 1500),
                  child: Container(
                    height: 160.h,
                    width: 400.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF26252C),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Weekly Stats",
                              style: TextStyle(
                                color: const Color(0xFF979797),
                                fontFamily: "SFPro",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              width: 120,
                              child: Text(
                                "$thisMonth",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "SFPro",
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              var data = widget.employee?.weeklyStats?.monday
                                      ?.split(':') ??
                                  [];
                              final hours = int.parse(data[0]);
                              final minutes = int.parse(data[1]);
                              final totalMinutes = (hours * 60) + minutes;
                              dailyMinutes.add(totalMinutes);
                            }
                            if (index == 1) {
                              var data = widget.employee?.weeklyStats?.tuesday
                                      ?.split(':') ??
                                  [];
                              final hours = int.parse(data[0]);
                              final minutes = int.parse(data[1]);
                              final totalMinutes = (hours * 60) + minutes;
                              dailyMinutes.add(totalMinutes);
                            }
                            if (index == 2) {
                              var data = widget.employee?.weeklyStats?.wednesday
                                      ?.split(':') ??
                                  [];
                              final hours = int.parse(data[0]);
                              final minutes = int.parse(data[1]);
                              final totalMinutes = (hours * 60) + minutes;
                              dailyMinutes.add(totalMinutes);
                            }
                            if (index == 3) {
                              var data = widget.employee?.weeklyStats?.thursday
                                      ?.split(':') ??
                                  [];
                              final hours = int.parse(data[0]);
                              final minutes = int.parse(data[1]);
                              final totalMinutes = (hours * 60) + minutes;
                              dailyMinutes.add(totalMinutes);
                            }
                            if (index == 4) {
                              var data = widget.employee?.weeklyStats?.friday
                                      ?.split(':') ??
                                  [];
                              final hours = int.parse(data[0]);
                              final minutes = int.parse(data[1]);
                              final totalMinutes = (hours * 60) + minutes;
                              dailyMinutes.add(totalMinutes);
                            }
                            return DelayedDisplay(
                              slidingCurve: Curves.ease,
                              slidingBeginOffset: const Offset(0, 0.0),
                              //fadingDuration: Duration(microseconds: 8000),
                              delay: Duration(milliseconds: 2000 + (index * 200)),
                              child: Container(
                                height: 100.h,
                                margin: EdgeInsets.only(
                                  left: 20.w,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: ((dailyMinutes[index]) / 7),
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            selectedDay == index
                                                ? const Color(0xFFDCF9FD)
                                                : const Color(0xFF929194),
                                            const Color(0xFF2C2B30),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          days[index],
                                          style: TextStyle(
                                            color: selectedDay == index
                                                ? const Color(0xFFDCF9FD)
                                                : const Color(0xFF979797),
                                            fontFamily: "SFPro",
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 3000),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Last 7 Days",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "SFPro",
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListView.separated(
                  itemCount: showMore ? 3 : widget.employee?.last7daysLogs?.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    Last7daysLogs? log = widget.employee?.last7daysLogs?[index];

                    if (log == null) {
                      return Container();
                    }

                    return DelayedDisplay(
                      slidingBeginOffset: const Offset(-0.1, 0),
                      delay: showMore ? Duration(milliseconds: 3200 + (index * 200)) : Duration(milliseconds: (index * 200)),
                      child: Container(
                        height: 80.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFF26252C),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 50.w,
                              height: 40.h,
                              color: Colors.white,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DateUtil.getDay(log.datetime ?? ''),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontFamily: "SFPro",
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                const Text(
                                  'Blockchain Internationale',
                                  style: TextStyle(
                                    color: Color(0xFF929194),
                                    fontFamily: "SFPro",
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.circle_rounded,
                                      size: 5,
                                      color: Color(0xFF36995E),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      DateUtil.getTime(log.datetime ?? ''),
                                      style: const TextStyle(
                                        color: Color(0xFFEBEBF5),
                                        fontFamily: "SFPro",
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 15.h,
                    );
                  },
                ),
                SizedBox(height: 20,),
                DelayedDisplay(
                  slidingCurve: Curves.bounceIn,
                    slidingBeginOffset: const Offset(0, -0.4),
                    delay: Duration(milliseconds: 4600),
                    child: moreButton()),
                SizedBox(height: 20,),
                DelayedDisplay(
                  slidingBeginOffset: const Offset(-0.1, 0),
                  delay: Duration(milliseconds: 4300),
                  child: GestureDetector(
                    onTap: () async {
                      final _url = Uri.parse('https://goerli.etherscan.io/tx/0x72f7c62f0a988680459b4d6780694ba0c2bd56927e733a3c2b05821198b80fc9');
                      if (await canLaunchUrl(_url)) {
                      await launchUrl(_url);
                      } else {
                      throw Exception('Could not launch $_url');
                      }
                    },
                    child: Container(
                      width: 359,
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0A84FF),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'VIEW BLOCKCHAIN TRANSACTION',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget moreButton() {
    return GestureDetector(
      onTap: ()=> setState(() {
        showMore =! showMore;
      }),
      child: Container(
        alignment: Alignment.center,
        child: showMore ? Icon(Icons.arrow_circle_down, color: Colors.white, size: 35,) : Icon(Icons.arrow_circle_up, color: Colors.white,size: 35,),
      ),
    );
  }
}
