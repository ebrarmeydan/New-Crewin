import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_button_bar/animated_button_bar.dart';
import '../landing.dart';
import 'sign_in.dart';
import 'sign_up.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _pageController = PageController();
  final bool _hasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LandingPage())),
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          AnimatedButtonBar(
            radius: 12.5,
            padding: const EdgeInsets.all(16.0),
            backgroundColor: Colors.blueGrey.shade200,
            foregroundColor: Colors.white,
            elevation: 5,
            borderColor: Colors.blueGrey.shade200,
            borderWidth: 1,
            innerVerticalPadding: 10,
            invertedSelection: true,
            children: [
              ButtonBarEntry(
                onTap: () {
                  _pageController.previousPage(
                      duration: const Duration(milliseconds: 1),
                      curve: Curves.linear);
                },
                child: Text("Sign Up",
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )),
              ),
              ButtonBarEntry(
                onTap: () {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 1),
                      curve: Curves.linear);
                },
                child: Text("Sign In",
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
          SizedBox(
              width: double.infinity,
              height: 600.0,
              child: PageView(
                controller: _pageController,
                children: const [SignUpPage(), SignInPage()],
              )),
        ]),
      ),
    );
  }
}
