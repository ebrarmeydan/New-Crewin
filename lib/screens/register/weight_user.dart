import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class WeightUser extends StatefulWidget {
  const WeightUser({Key? key}) : super(key: key);

  @override
  State<WeightUser> createState() => _WeightUserState();
}

class _WeightUserState extends State<WeightUser> {
  int _currentValue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("How much is your lenght?",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  )),
              SizedBox(height: 100.h),
              NumberPicker(
                value: _currentValue,
                minValue: 20,
                maxValue: 200,
                onChanged: (value) => setState(() => _currentValue = value),
              ),
            ]),
      ),
    );
  }
}
