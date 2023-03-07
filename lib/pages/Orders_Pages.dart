import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/Tafseel_Detail.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/combonents/img_container.dart';
import 'package:flutter/material.dart';

import '../combonents/Drawer/DrawerWidget.dart';

class orders_page extends StatefulWidget {
  const orders_page({super.key});

  @override
  State<orders_page> createState() => _orders_pageState();
}

class _orders_pageState extends State<orders_page> {
  StreamSubscription? listener_of_T_Details;

  List<Tafseel_Details> T_Details = [];

  @override
  void initState() {
    listener_of_T_Details?.cancel();

    super.initState();

    listenToT_Details();
  }

  listenToT_Details() {
    listener_of_T_Details ??= FirebaseFirestore.instance.collection('cart_content').snapshots().listen((collection) {
      List<Tafseel_Details> newList = [];
      for (final doc in collection.docs) {
        final tDetail = Tafseel_Details.fromMap(doc.data());
        newList.add(tDetail);
      }
      T_Details = newList;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors_and_Dimentions.BK_color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 0, 0, 0).withOpacity(0.1),
        centerTitle: true,
        title: Image.network(
          'https://cdn.discordapp.com/attachments/1081328393364189276/1082219855991803984/image_146.png',
          fit: BoxFit.contain,
        ),
      ),
      //drawer
      endDrawer: const DrawerWidget(),
      body: ListView(
        children: [
          for (var i in T_Details)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 35, 35, 35).withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ], borderRadius: BorderRadius.circular(12), color: Colors_and_Dimentions.main_continer_color),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: const [
                                      FP_textSTyle(
                                        text_content: 'حالة الطلب',
                                        font_weight: FontWeight.bold,
                                      ),
                                      FP_textSTyle(
                                        text_content: "قيد التنفيذ",
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const FP_textSTyle(
                                        text_content: 'الخياط',
                                        font_weight: FontWeight.bold,
                                      ),
                                      FP_textSTyle(
                                        text_content: i.tailor,
                                        font_weight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Row(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FP_textSTyle(
                                        text_content: i.qumash,
                                        font_weight: FontWeight.bold,
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Container(
                                          alignment: Alignment.centerLeft,
                                          width: 220,
                                          child: FP_textSTyle(text_content: i.qumash_D)),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  IMg_container(
                                    Img_URL: i.qumash_IMG,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      const FP_textSTyle(
                                        font_size: 32,
                                        font_weight: FontWeight.bold,
                                        text_content: 'ريال',
                                      ),
                                      FP_textSTyle(
                                        font_size: 32,
                                        font_weight: FontWeight.bold,
                                        text_content: i.qumash_Price,
                                      ),
                                    ],
                                  ),
                                  const FP_textSTyle(
                                    text_content: 'اعادة طلب ',
                                    font_weight: FontWeight.w600,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                )
              ],
            )
        ],
      ),
    );
  }
}
