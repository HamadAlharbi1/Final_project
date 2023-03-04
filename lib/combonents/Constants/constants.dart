import 'package:flutter/material.dart';

class Colors_and_Dimentions {
  static const fontcolor = Color.fromARGB(255, 33, 33, 33);
  static const fontcolor2 = Color.fromARGB(255, 50, 24, 0);
  static const containercolor = Color.fromARGB(255, 202, 182, 182);
  static const double fontsize_8 = 8;
  static const double fontsize_12 = 12;
  static const double Circular_border_12 = 12;
  static const double Padding_12 = 12;
   static const double Padding_4 = 4;
  static const double pic_H = 150;
  static const double pic_W = 150;
  static const double Hight_16 = 16;
}

class FP_textSTyle extends StatelessWidget {
  final String text_content;
  final double font_size;
  final Color text_color;
  final FontWeight font_weight;

  const FP_textSTyle(
      {Key? key,
      required this.text_content,
      this.text_color = Colors_and_Dimentions.fontcolor,
      this.font_size = 16,
      this.font_weight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text_content,
      style: TextStyle(color: text_color, fontSize: font_size, fontWeight: font_weight),
    );
  }
}
