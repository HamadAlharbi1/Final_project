import 'package:flutter/material.dart';

class Colors_and_Dimentions {
  static const fontcolor = Color(0xFF443830);
  static const fontcolor2 = Color(0xFF443830);
  static const containercolor = Color.fromARGB(255, 234, 225, 225);
  static const BK_color = Color(0xFFEAEAEA);
  static const main_continer_color = Color(0xFFF1F0F0);
  static const container_color = Color(0xFF796763);
  static const font_color = Color(0xFF443830);
  static const double fontsize_8 = 8;
  static const double fontsize_12 = 12;
  static const double Hight_70 = 70;
  static const double Circular_border_12 = 12;
  static const double Padding_12 = 12;
  static const double Padding_4 = 4;
  static const double pic_H = 150;
  static const double pic_W = 150;
  static const double Hight_16 = 16;
  static const double tailor_Hpic_H = 300;
  static const double tailor_Hpic_W = 350;
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
      style: TextStyle(
        color: text_color,
        fontSize: font_size,
        fontWeight: font_weight,
        overflow: TextOverflow.clip,
      ),
    );
  }
}
