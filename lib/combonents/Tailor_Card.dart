import 'package:final_project/combonents/Constants/Tailor_Details_modols.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:flutter/material.dart';

class Tailor_Card extends StatelessWidget {
  final Tailor_Details item;
  const Tailor_Card({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: Colors_and_Dimentions.Hight_16,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 35, 35, 35).withOpacity(0.33),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ], borderRadius: BorderRadius.circular(12), color: Colors_and_Dimentions.main_continer_color),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Column(
                                  children: [
                                    FP_textSTyle(
                                      text_content: item.Rate,
                                      font_size: 12,
                                      font_weight: FontWeight.bold,
                                      text_color: Colors_and_Dimentions.fontcolor2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                FP_textSTyle(
                                  text_content: item.Tailor_name,
                                  font_weight: FontWeight.bold,
                                  text_color: Colors_and_Dimentions.fontcolor2,
                                ),
                                FP_textSTyle(
                                  text_content: item.location,
                                  font_weight: FontWeight.bold,
                                  text_color: Colors_and_Dimentions.fontcolor2,
                                ),
                                const SizedBox(
                                  height: Colors_and_Dimentions.Hight_16,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  height: Colors_and_Dimentions.pic_H,
                  width: Colors_and_Dimentions.pic_W,
                  child: Image.network(
                    item.Image_URL,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
