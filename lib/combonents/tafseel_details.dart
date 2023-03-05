import 'package:final_project/combonents/Constants/constants.dart';
import 'package:flutter/material.dart';

class tafseel_details extends StatelessWidget {
  final String title;
  final Function MY_ontap;
  final String image_1;
  final String image_2;
  final String image_3;
  const tafseel_details({
    required this.MY_ontap,
    required this.image_1,
    required this.title,
    this.image_2 = '',
    this.image_3 = '',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 35, 35, 35).withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ], borderRadius: BorderRadius.circular(12), color: Colors_and_Dimentions.main_continer_color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  FP_textSTyle(
                    text_content: title,
                  ),
                  const SizedBox(
                    height: Colors_and_Dimentions.Hight_70,
                  ),
                  InkWell(
                    onTap: MY_ontap(),
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(Colors_and_Dimentions.Circular_border_12)),
                      height: Colors_and_Dimentions.pic_H,
                      width: Colors_and_Dimentions.pic_W,
                      child: Image.network(
                        image_1,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: Colors_and_Dimentions.Hight_70,
                  ),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(Colors_and_Dimentions.Circular_border_12)),
                    height: Colors_and_Dimentions.pic_H,
                    width: Colors_and_Dimentions.pic_W,
                    child: Image.network(
                      image_2,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: Colors_and_Dimentions.Hight_70,
                  ),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(Colors_and_Dimentions.Circular_border_12)),
                    height: Colors_and_Dimentions.pic_H,
                    width: Colors_and_Dimentions.pic_W,
                    child: Image.network(
                      image_3,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
