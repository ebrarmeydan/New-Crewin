import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class AgeUserPage extends StatefulWidget {
  const AgeUserPage({Key? key}) : super(key: key);

  @override
  State<AgeUserPage> createState() => _AgeUserPageState();
}

class _AgeUserPageState extends State<AgeUserPage> {
  int _currentValue = 23;

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
              Text("How old are you?",
                  style: GoogleFonts.poppins(
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  )),
              SizedBox(height: 100.h),
              NumberPicker(
                value: _currentValue,
                minValue: 5,
                maxValue: 100,
                onChanged: (value) => setState(() => _currentValue = value),
              ),
            ]),
      ),
    );
  }
}
