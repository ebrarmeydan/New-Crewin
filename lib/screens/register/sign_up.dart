import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register_name.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final reWritePasswordController = TextEditingController();
  bool isVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    reWritePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  Column(
                    children: [
                      ClipRRect(
                        child: SizedBox(
                          width: size.width.w * 0.8,
                          child: _buildForm(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Form _buildForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 16.h),
          _buildEmailField(),
          SizedBox(height: 16.h),
          _buildPasswordField(),
          SizedBox(height: 16.h),
          _builReWritePassword(),
          SizedBox(height: 120.h),
          _buildContinueButton(context),
        ],
      ),
    );
  }

  bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  Widget _buildEmailField() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white.withOpacity(0.6),
        ),
        child: TextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value!.isEmpty) {
              callSnackbar('Email boş olamaz!');
            } else if (!isValidEmail(value)) {
              callSnackbar("Email formatı hatalı!");
            }
            return null;
          },
          decoration: const InputDecoration(
            labelText: "Email",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white.withOpacity(0.6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ]),
        child: TextFormField(
          controller: passwordController,
          validator: (value) {
            if (value != null && value.length < 6) {
              callSnackbar('Enter min. 6 characters');
            }
            return null;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Password",
              suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: const Icon(Icons.visibility))),
          obscureText: !isVisible,
        ),
      ),
    );
  }

  Widget _builReWritePassword() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white.withOpacity(0.6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ]),
        child: TextFormField(
          controller: reWritePasswordController,
          validator: (value) {
            if (value!.isEmpty && value.length < 6) {
              callSnackbar('Şifre alanı boş olamaz ve 6 haneli olmadır');
            } else if (value != passwordController.text) {
              callSnackbar("Şifreler aynı değil!");
            } else {
              return null;
            }
            return null;
          },
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Password Again",
              suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: const Icon(Icons.visibility))),
          obscureText: !isVisible,
        ),
      ),
    );
  }

  //  kayıt ol continue butonu
  ElevatedButton _buildContinueButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.black,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
          minimumSize: const Size(double.infinity, 50)),
      onPressed: () async {
        if (formKey.currentState?.validate() ?? false) {
          await signUp();
        }
      },
      child: Text("Continue",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          )),
    );
  }

  // uyarı mesajı
  void callSnackbar(String error, [Color? color, VoidCallback? onVisible]) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      //padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      backgroundColor: color ?? Colors.red,
      duration: const Duration(milliseconds: 500),
      onVisible: onVisible,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: SizedBox(
        width: 40.w,
        height: 40.h,
        child: Center(
          child: Text(error, style: const TextStyle(color: Colors.white)),
        ),
      ),
    ));
  }

  //Firebase kayıt fonksiyonu
  Future signUp() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: reWritePasswordController.text);

      callSnackbar("Kayıt başarılı !", Colors.green, () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const RegisterName()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-exists' ||
          e.code == 'email-already-in-use') {
        callSnackbar("Bu e-mail daha önce kullanılmış!");
      }
    }
  }
}
