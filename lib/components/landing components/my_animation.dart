import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class MyAnimation extends StatefulWidget {
  const MyAnimation({Key? key}) : super(key: key);

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 16.w,
      ),
      Lottie.asset(
        'assets/49964-running-on-treadmill.json',
        width: 512.w,
        height: 200.h,
      ),
    ]);
  }
}
