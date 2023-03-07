import 'package:final_project/combonents/Constants/constants.dart';
import 'package:flutter/material.dart';

class TextField1 extends StatelessWidget {
  const TextField1({
    this.textType,
    super.key,
    required this.Enable,
    required this.secure_text,
    required this.controll,
    required this.isFocused,
    required this.hint1,
    this.icon1,
  });
  final TextEditingController controll;
  final bool secure_text;
  final bool isFocused;
  final String hint1;
  final IconData? icon1;
  final bool Enable;
  final TextInputType? textType;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        textAlign: TextAlign.end,
        keyboardType: textType,
        obscureText: secure_text,
        controller: controll,
        decoration: InputDecoration(
          hintText: hint1,
          hintTextDirection: TextDirection.ltr,
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 88, 106, 109),
            fontWeight: FontWeight.bold,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff796763), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}
