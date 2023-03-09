import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/pages/Tailor_Details_Page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Tailor_Card extends StatefulWidget {
  // final Tailor_Details item;
  final String location;
  final String img;
  final String tailor_name;
  final String tailor_rate;
  final String tailor_availabilty;
  final String tailor_worktime;
  final String google_map;

  const Tailor_Card(
      {super.key,
      //  this.item,
      required this.location,
      required this.img,
      required this.tailor_name,
      required this.tailor_rate,
      required this.tailor_availabilty,
      required this.tailor_worktime,
      required this.google_map});

  @override
  State<Tailor_Card> createState() => _Tailor_CardState();
}

class _Tailor_CardState extends State<Tailor_Card> {
  void locationfun() async {
    await launch(widget.google_map);
  }

//https://maps.app.goo.gl/Q6mC8CoMSi6ESUUJ6
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: Colors_and_Dimentions.Hight_16,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Tailor_Details_Page(
                  tailor_nameShow: widget.tailor_name,
                  tailor_locatioShow: widget.location,
                  tailor_rateShow: widget.tailor_rate,
                  tailor_imgShow: widget.img,
                  tailor_availabilityShow: widget.tailor_availabilty,
                  tailor_worktimeShow: widget.tailor_worktime,
                );
              }));
            },
            child: Container(
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
                                              text_content: widget.tailor_rate,
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
                                    SizedBox(
                                      height: 24,
                                      child: Expanded(
                                        child: FP_textSTyle(
                                          text_content: widget.tailor_name,
                                          font_weight: FontWeight.bold,
                                          text_color: Colors_and_Dimentions.fontcolor2,
                                        ),
                                      ),
                                    ),
                                    FP_textSTyle(
                                      text_content: widget.location,
                                      font_weight: FontWeight.w200,
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
                        widget.img,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
