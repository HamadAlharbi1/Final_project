import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/Qumash_Details_modols.dart';
import 'package:final_project/combonents/Constants/Tafseel_Detail.dart';
import 'package:final_project/combonents/Constants/Tailor_Details_modols.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/combonents/Qumash_Card.dart';
import 'package:final_project/pages/tafseel_details/1yaqa.dart';
import 'package:flutter/material.dart';

class Tailor_Details_Page extends StatefulWidget {
  final Tailor_Details tailor;
  const Tailor_Details_Page({super.key, required this.tailor});

  @override
  State<Tailor_Details_Page> createState() => _Tailor_Details_PageState();
}

class _Tailor_Details_PageState extends State<Tailor_Details_Page> {
  StreamSubscription? listener_of_Tailors;
  StreamSubscription? listener_of_Qumashs;
  StreamSubscription? listener_of_order_details;
  List<Tailor_Details> tailors = [];
  List<Qumash_Details> qumashs = [];
  List<Tafseel_Details> order_details = [];

  @override
  void initState() {
    listener_of_Tailors?.cancel();
    listener_of_Qumashs?.cancel();
    listener_of_order_details?.cancel();
    super.initState();
    listenToQumashs();
    listenToTailors();
  }

  listenToTailors() {
    listener_of_Tailors ??= FirebaseFirestore.instance.collection('List_of_Tailors').snapshots().listen((collection) {
      List<Tailor_Details> newList = [];
      for (final doc in collection.docs) {
        final tailor = Tailor_Details.fromMap(doc.data());
        newList.add(tailor);
      }
      tailors = newList;
      setState(() {});
    });
  }

  listenToorder_details() {
    listener_of_order_details ??=
        FirebaseFirestore.instance.collection('order_details').snapshots().listen((collection) {
      List<Tafseel_Details> newList = [];
      for (final doc in collection.docs) {
        final orderDetail = Tafseel_Details.fromMap(doc.data());
        newList.add(orderDetail);
      }
      order_details = newList;
      setState(() {});
    });
  }

  listenToQumashs() {
    listener_of_Qumashs ??= FirebaseFirestore.instance.collection('List_of_Qumashs').snapshots().listen((collection) {
      List<Qumash_Details> newList = [];
      for (final doc in collection.docs) {
        final qumash = Qumash_Details.fromMap(doc.data());
        newList.add(qumash);
      }
      qumashs = newList;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_and_Dimentions.BK_color,
      body: Padding(
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    height: 100,
                    width: 100,
                    child: Image.network(
                      widget.tailor.Image_URL,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: Colors_and_Dimentions.Padding_4,
              ),
              Container(
                alignment: Alignment.center,
                child: FP_textSTyle(
                    text_content: widget.tailor.Tailor_name,
                    text_color: Colors_and_Dimentions.fontcolor2,
                    font_weight: FontWeight.bold),
              ),
              const SizedBox(
                height: Colors_and_Dimentions.Padding_4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(
                                width: Colors_and_Dimentions.Padding_4,
                              ),
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.amber,
                              ),
                              const SizedBox(
                                width: Colors_and_Dimentions.Padding_4,
                              ),
                              FP_textSTyle(
                                text_content: widget.tailor.Rate,
                                font_size: Colors_and_Dimentions.fontsize_12,
                                text_color: Colors_and_Dimentions.fontcolor2,
                              ),
                              const SizedBox(
                                width: Colors_and_Dimentions.Padding_4,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: Colors_and_Dimentions.Hight_16,
                          ),
                          FP_textSTyle(
                            text_content: widget.tailor.The_ability,
                            font_size: Colors_and_Dimentions.fontsize_12,
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
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          FP_textSTyle(
                            text_content: widget.tailor.location,
                            font_size: Colors_and_Dimentions.fontsize_12,
                            text_color: Colors_and_Dimentions.fontcolor2,
                          ),
                          const SizedBox(
                            height: Colors_and_Dimentions.Hight_16,
                          ),
                          FP_textSTyle(
                            text_content: widget.tailor.avarge_period,
                            font_size: Colors_and_Dimentions.fontsize_12,
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
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                color: Colors_and_Dimentions.container_color,
                height: 1,
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 600,
                child: ListView(
                  children: [
                    for (var qumash in qumashs)
                      InkWell(
                          onTap: () {
                            final CollectionReference collectionRef =
                                FirebaseFirestore.instance.collection('order_details');

                            collectionRef.doc('1').set({
                              'id': '',
                              'tailor': widget.tailor.Tailor_name,
                              'qumash': qumash.Qumash_name,
                              'qumash_D': qumash.Describtion,
                              'qumash_IMG': qumash.Image_URL,
                              'qumash_Price': qumash.price,
                              'Yaqa': '',
                              'Jubzor': '',
                              'Zorar': '',
                              'Kapak': '',
                              'Tallstyle': '',
                              'tadrizestyle': '',
                            }).then((value) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Yaqa(), // pass the document ID to the next page
                                ),
                              );
                            }).catchError((error) => print('Failed to add document: $error'));
                          },
                          child: Qumash_Card(qumash: qumash))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
