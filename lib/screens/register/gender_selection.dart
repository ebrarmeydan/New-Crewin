import 'package:flutter/material.dart';
import '../../components/register components/gender_widget.dart';

class GenderSelectionpage extends StatefulWidget {
  const GenderSelectionpage({Key? key}) : super(key: key);

  @override
  State<GenderSelectionpage> createState() => _GenderSelectionpageState();
}

class _GenderSelectionpageState extends State<GenderSelectionpage> {
  int _gender = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Card(
          elevation: 0,
          shape: const RoundedRectangleBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GenderWidget(onChange: (genderVal) {
                _gender = genderVal;
              }),
            ],
          ),
        ),
      ),
    );
  }
}
