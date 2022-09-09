import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/landing components/my_animation.dart';
import 'home.dart';
import 'register/register_main.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const MyAnimation(),
                  SizedBox(height: 16.w),
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Description of Test Pro \nDescription of Test Pro \nDescription of Test Pro",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      )),
                  SizedBox(height: 16.h),
                  _buildEmail(context),
                  SizedBox(height: 16.h),
                  _buildGoogle(context),
                  SizedBox(height: 16.h),
                  _buildFacebook(context),
                  SizedBox(height: 16.h),
                  _buildWithoutSigningUp(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

ElevatedButton _buildEmail(BuildContext context) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        minimumSize: const Size(250, 50)),
    onPressed: () => Navigator.push(
        context, MaterialPageRoute(builder: (context) => const RegisterPage())),
    icon: const Icon(Icons.email),
    label: Text("Sign in E-mail",
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        )),
  );
}

ElevatedButton _buildGoogle(BuildContext context) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        minimumSize: const Size(250, 50)),
    onPressed: () {
      // Zaman yetmedi
    },
    icon:
        const FaIcon(FontAwesomeIcons.google, color: Colors.black, size: 22.0),
    label: Text("Sign in Google",
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        )),
  );
}

ElevatedButton _buildFacebook(BuildContext context) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        minimumSize: const Size(250, 50)),
    onPressed: () {
      // Zaman yetmedi
    },
    icon: const Icon(Icons.facebook),
    label: Text("Sign in Facebook",
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        )),
  );
}

ElevatedButton _buildWithoutSigningUp(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        minimumSize: const Size(250, 50)),
    onPressed: () => Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage())),
    child: Text("Without Signing Up",
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        )),
  );
}
