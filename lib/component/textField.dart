import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String textHint;
  final bool abscureText;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.textHint,
      required this.abscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: abscureText,
      decoration: InputDecoration(
          labelText: textHint,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey.shade400),
      controller: controller,
    );
  }
}
