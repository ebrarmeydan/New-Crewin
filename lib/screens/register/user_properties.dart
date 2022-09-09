import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'age_user.dart';
import 'gender_selection.dart';
import 'height_user.dart';
import 'register_name.dart';
import 'weight_user.dart';

class UserProperties extends StatefulWidget {
  const UserProperties({Key? key}) : super(key: key);

  @override
  State<UserProperties> createState() => _UserPropertiesState();
}

class _UserPropertiesState extends State<UserProperties> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RegisterName())),
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: 900,
        padding: const EdgeInsets.only(bottom: 80),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 500,
                child: PageView(
                  controller: _pageController,
                  children: const [
                    GenderSelectionpage(),
                    AgeUserPage(),
                    HeightUser(),
                    WeightUser(),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 1),
                      curve: Curves.linear);
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.black,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.5)),
                    minimumSize: const Size(325, 50)),
                child: Text("Next",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: SizedBox(
        //color: Colors.deepPurple,
        // padding: EdgeInsets.symmetric(horizontal: 50),
        height: 80,
        child: Center(
            child: SmoothPageIndicator(
                controller: _pageController,
                count: 4,
                effect: const WormEffect(
                    activeDotColor: Colors.black,
                    radius: 8,
                    dotWidth: 10,
                    dotHeight: 10))),
      ),
    );
  }
}
