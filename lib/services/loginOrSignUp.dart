import 'package:chat_app/screen/login_screen.dart';
import 'package:chat_app/screen/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginOrSignUp extends StatefulWidget {
  const LoginOrSignUp({super.key});

  @override
  State<LoginOrSignUp> createState() => _LoginOrSignUpState();
}

class _LoginOrSignUpState extends State<LoginOrSignUp> {
  bool showPage = true;

  void togglePage() {
    setState(() {
      showPage = !showPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showPage) {
      return LoginScreen(ontap: togglePage);
    } else {
      return SignUpScreen(ontap: togglePage);
    }
    ;
  }
}
