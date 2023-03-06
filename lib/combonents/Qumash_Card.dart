import 'package:final_project/combonents/Constants/Qumash_Details_modols.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/combonents/Qumash_description.dart';
import 'package:final_project/combonents/img_container.dart';
import 'package:flutter/material.dart';

class Qumash_Card extends StatelessWidget {
  final Qumash_Details qumash;
  const Qumash_Card({super.key, required this.qumash});

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
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FP_textSTyle(
                          text_content: qumash.Qumash_name,
                          font_weight: FontWeight.bold,
                          text_color: Colors_and_Dimentions.fontcolor2,
                        ),
                        const SizedBox(
                          height: Colors_and_Dimentions.Hight_16,
                        ),
                        qumash_des_container(qumash_des: qumash.Describtion),
                        const SizedBox(
                          height: Colors_and_Dimentions.Hight_16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                FP_textSTyle(
                                  text_content: qumash.Rate,
                                  font_size: Colors_and_Dimentions.fontsize_12,
                                  text_color: Colors_and_Dimentions.fontcolor2,
                                ),
                                const SizedBox(
                                  height: Colors_and_Dimentions.Hight_16,
                                ),
                                FP_textSTyle(
                                  text_content: '${qumash.price}',
                                  font_size: Colors_and_Dimentions.fontsize_12,
                                  text_color: Colors_and_Dimentions.fontcolor2,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: Colors_and_Dimentions.Hight_16,
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
                                  text_content: 'السعر ',
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
                const SizedBox(
                  width: 32,
                ),
                IMg_container(Img_URL: qumash.Image_URL),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class qumash_des_container extends StatelessWidget {
  final String qumash_des;
  const qumash_des_container({
    super.key,
    required this.qumash_des,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Qumash_Description(
            qumash_Description: qumash_des,
          ),
          const SizedBox(
            width: Colors_and_Dimentions.Hight_16,
          ),
          const FP_textSTyle(
            text_content: "الوصف",
            font_weight: FontWeight.bold,
            font_size: Colors_and_Dimentions.fontsize_12,
            text_color: Colors_and_Dimentions.fontcolor2,
          ),
        ],
      ),
    );
  }
}
