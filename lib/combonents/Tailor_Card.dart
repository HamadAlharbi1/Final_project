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
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Colors_and_Dimentions.Circular_border_12),
              color: Colors_and_Dimentions.containercolor),
          padding: const EdgeInsets.all(Colors_and_Dimentions.Padding_4),
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
                        FP_textSTyle(
                          text_content: item.Tailor_name,
                          font_weight: FontWeight.bold,
                          text_color: Colors_and_Dimentions.fontcolor2,
                        ),
                        const SizedBox(
                          height: Colors_and_Dimentions.Hight_16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                FP_textSTyle(
                                  text_content: item.Rate,
                                  font_size: Colors_and_Dimentions.fontsize_8,
                                  text_color: Colors_and_Dimentions.fontcolor2,
                                ),
                                const SizedBox(
                                  height: Colors_and_Dimentions.Hight_16,
                                ),
                                FP_textSTyle(
                                  text_content: item.The_ability,
                                  font_size: Colors_and_Dimentions.fontsize_8,
                                  text_color: Colors_and_Dimentions.fontcolor2,
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                FP_textSTyle(
                                  text_content: 'التقييم',
                                  font_weight: FontWeight.bold,
                                  font_size: Colors_and_Dimentions.fontsize_12,
                                  text_color: Colors_and_Dimentions.fontcolor2,
                                ),
                                SizedBox(
                                  height: Colors_and_Dimentions.Hight_16,
                                ),
                                FP_textSTyle(
                                  text_content: 'التوفر',
                                  font_weight: FontWeight.bold,
                                  font_size: Colors_and_Dimentions.fontsize_12,
                                  text_color: Colors_and_Dimentions.fontcolor2,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                FP_textSTyle(
                                  text_content: item.location,
                                  font_size: Colors_and_Dimentions.fontsize_8,
                                  text_color: Colors_and_Dimentions.fontcolor2,
                                ),
                                const SizedBox(
                                  height: Colors_and_Dimentions.Hight_16,
                                ),
                                FP_textSTyle(
                                  text_content: item.avarge_period,
                                  font_size: Colors_and_Dimentions.fontsize_8,
                                  text_color: Colors_and_Dimentions.fontcolor2,
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                FP_textSTyle(
                                  text_content: 'الموقع',
                                  font_weight: FontWeight.bold,
                                  font_size: Colors_and_Dimentions.fontsize_12,
                                  text_color: Colors_and_Dimentions.fontcolor2,
                                ),
                                SizedBox(
                                  height: Colors_and_Dimentions.Hight_16,
                                ),
                                FP_textSTyle(
                                  text_content: 'مدة الانجاز',
                                  font_weight: FontWeight.bold,
                                  font_size: Colors_and_Dimentions.fontsize_12,
                                  text_color: Colors_and_Dimentions.fontcolor2,
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
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(Colors_and_Dimentions.Circular_border_12)),
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