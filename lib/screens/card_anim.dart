import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sensors_plus/sensors_plus.dart';

class CardAnim extends StatefulWidget {
  final String img;
  const CardAnim({Key? key, required this.img}) : super(key: key);

  @override
  State<CardAnim> createState() => _CardAnimState();
}

class _CardAnimState extends State<CardAnim> {
  double _x = 0;
  double _y = 0;

  changeX(double value) {
    setState(() {
      //_x = (value - 5) * 0.03;
      _x = 0;
    });
  }

  changeY(double value) {
    setState(() {
      _y = value * 0.03;
    });
  }

  @override
  void initState() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      changeX(event.z);
      changeY(event.x);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // perspective
        ..rotateX(_x)
        ..rotateY(_y),
      alignment: FractionalOffset.center,
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 200.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Image.network(
          widget.img,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
