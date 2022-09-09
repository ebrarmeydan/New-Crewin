import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderWidget extends StatefulWidget {
  final Function(int) onChange;
  const GenderWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  int _gender = 0;

  final ChoiceChip3DStyle selectedStyle = ChoiceChip3DStyle(
      topColor: Colors.white,
      backColor: Colors.white,
      borderRadius: BorderRadius.circular(20));

  final ChoiceChip3DStyle unselectedStyle = ChoiceChip3DStyle(
      topColor: Colors.grey,
      backColor: Colors.blueGrey,
      borderRadius: BorderRadius.circular(20));

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip3D(
          border: Border.all(color: Colors.grey),
          width: 165.w,
          height: 165.h,
          style: _gender == 1 ? selectedStyle : unselectedStyle,
          onSelected: () {
            setState(() {
              _gender = 1;
            });
            widget.onChange(_gender);
          },
          onUnSelected: () {},
          selected: _gender == 1,
          child: Column(
            children: [
              const Icon(Icons.male, size: 100),
              const SizedBox(height: 5),
              Text("Male",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  )),
            ],
          ),
        ),
        ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            width: 165.w,
            height: 165.h,
            style: _gender == 2 ? selectedStyle : unselectedStyle,
            onSelected: () {
              setState(() {
                _gender = 2;
              });
              widget.onChange(_gender);
            },
            selected: _gender == 2,
            onUnSelected: () {},
            child: Column(
              children: [
                const Icon(Icons.female, size: 100),
                const SizedBox(height: 5),
                Text("Female",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ))
              ],
            ))
      ],
    );
  }
}
