import 'package:final_project/combonents/Constants/Tailor_Details_modols.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Tailor_Card extends StatefulWidget {
  final Tailor_Details item;
  const Tailor_Card({super.key, required this.item});

  @override
  State<Tailor_Card> createState() => _Tailor_CardState();
}

class _Tailor_CardState extends State<Tailor_Card> {
  void locationfun() async {
    await launch('https://maps.app.goo.gl/bEUTWCaYY8VkhRho6');
  }

//https://maps.app.goo.gl/Q6mC8CoMSi6ESUUJ6
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: Colors_and_Dimentions.Hight_16,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 1)]),
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
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 32,
                                      color: Colors.yellow,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Column(
                                      children: [
                                        FP_textSTyle(
                                          text_content: widget.item.Rate,
                                          font_weight: FontWeight.bold,
                                          text_color: Colors_and_Dimentions.fontcolor2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                InkWell(
                                  onTap: locationfun,
                                  child: const Icon(
                                    Icons.location_history,
                                    size: 32,
                                    color: Colors_and_Dimentions.font_color,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                FP_textSTyle(
                                  text_content: widget.item.Tailor_name,
                                  font_weight: FontWeight.bold,
                                  text_color: Colors_and_Dimentions.fontcolor2,
                                ),
                                FP_textSTyle(
                                  text_content: widget.item.location,
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
                    widget.item.Image_URL,
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
