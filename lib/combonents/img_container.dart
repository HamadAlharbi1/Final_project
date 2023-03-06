import 'package:final_project/combonents/Constants/constants.dart';
import 'package:flutter/material.dart';

class IMg_container extends StatelessWidget {
  final String Img_URL;
  const IMg_container({super.key, required this.Img_URL});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Colors_and_Dimentions.Circular_border_12)),
      height: Colors_and_Dimentions.pic_H,
      width: Colors_and_Dimentions.pic_W,
      child: Image.network(
        Img_URL,
        fit: BoxFit.cover,
      ),
    );
  }
}
