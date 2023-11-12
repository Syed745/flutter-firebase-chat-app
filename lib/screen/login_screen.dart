import 'package:chat_app/component/myButton.dart';
import 'package:chat_app/component/textField.dart';
import 'package:chat_app/screen/auth/authServices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? ontap;
  const LoginScreen({super.key, required this.ontap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

//
  void login() async {
    final authService = Provider.of<AuthServices>(context, listen: false);

    try {
      await authService.signInWithEmailandPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              const Icon(Icons.message_sharp, size: 80),
              SizedBox(
                height: 20,
              ),
              Text("Welcome back you've been missed"),
              SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: emailController,
                textHint: "Email",
                abscureText: false,
              ),
              SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: passwordController,
                textHint: "Password",
                abscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              MyButton(
                ontap: login,
                text: 'LOGIN',
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  GestureDetector(
                    onTap: widget.ontap,
                    child: Text(
                      "Register",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
