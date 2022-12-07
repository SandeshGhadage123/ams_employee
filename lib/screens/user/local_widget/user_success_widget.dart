import 'package:ams_employee/model/employee_models/EmpDashboardModel.dart';
import 'package:ams_employee/screens/card_anim.dart';
import 'package:ams_employee/util/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserSuccessWidget extends StatefulWidget {
  final EmpDashboardModel? employee;
  const UserSuccessWidget({Key? key, required this.employee}) : super(key: key);

  @override
  State<UserSuccessWidget> createState() => _UserSuccessWidgetState();
}

class _UserSuccessWidgetState extends State<UserSuccessWidget> {
  final List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri"];
  final int selectedDay = 1;

  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                Text(
                  "Welcome,",
                  style: TextStyle(
                    color: const Color(0xFFfafafa),
                    fontFamily: "SFPro",
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CardAnim(
                  img: widget.employee?.image ?? '',
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
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
                            widget.employee?.attendance ?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "SFPro",
                              fontSize: 50.sp,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  widget.employee?.recentLog ?? '',
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    const Icon(
                                      Icons.info_rounded,
                                      color: Colors.white,
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
                SizedBox(
                  height: 20.h,
                ),
                Container(
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
                          Text(
                            "February",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "SFPro",
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: days.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100.h,
                            margin: EdgeInsets.only(
                              left: 20.w,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: ((index + 1) * 20).h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        selectedDay == index ? const Color(0xFFDCF9FD) : const Color(0xFF929194),
                                        const Color(0xFF2C2B30),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      days[index],
                                      style: TextStyle(
                                        color: selectedDay == index ? const Color(0xFFDCF9FD) : const Color(0xFF979797),
                                        fontFamily: "SFPro",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Last 7 Days",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "SFPro",
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListView.separated(
                  itemCount: widget.employee?.last7daysLogs?.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    Last7daysLogs? log = widget.employee?.last7daysLogs?[index];

                    if (log == null) {
                      return Container();
                    }

                    return Container(
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFF26252C),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 15.h,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
