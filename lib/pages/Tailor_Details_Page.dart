import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/Qumash_Details_modols.dart';
import 'package:final_project/combonents/Constants/Tafseel_Detail.dart';
import 'package:final_project/combonents/Constants/Tailor_Details_modols.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/combonents/Qumash_Card.dart';
import 'package:final_project/pages/tafseel_details/1yaqa.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../combonents/Drawer/DrawerWidget.dart';

class Tailor_Details_Page extends StatefulWidget {
  // final Tailor_Details tailor;required this.tailor
  final String tailor_nameShow;
  final String tailor_locatioShow;
  final String tailor_rateShow;
  final String tailor_imgShow;
  final String tailor_availabilityShow;
  final String tailor_worktimeShow;
  const Tailor_Details_Page({
    required this.tailor_nameShow,
    super.key,
    required this.tailor_locatioShow,
    required this.tailor_rateShow,
    required this.tailor_imgShow,
    required this.tailor_availabilityShow,
    required this.tailor_worktimeShow,
  });

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
  var _uid;

  @override
  void initState() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    _uid = user!.uid;

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
      // backgroundColor: Colors_and_Dimentions.BK_color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors_and_Dimentions.icon_color,
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
          Padding(
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
                  /// ????????????
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                        height: 100,
                        width: 100,
                        child: Image.network(
                          widget.tailor_imgShow,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: Colors_and_Dimentions.Padding_4,
                  ),

                  ///?????? ????????????
                  Container(
                    alignment: Alignment.center,
                    child: FP_textSTyle(
                        text_content: widget.tailor_nameShow,
                        text_color: Colors_and_Dimentions.fontcolor2,
                        font_weight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 32,
                  ),

                  /// ??????????????
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
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
                                    text_content: widget.tailor_rateShow,
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
                                text_content: widget.tailor_availabilityShow,
                                font_size: Colors_and_Dimentions.fontsize_12,
                                text_color: Colors_and_Dimentions.fontcolor2,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            children: const [
                              FP_textSTyle(
                                text_content: '??????????????',
                                font_weight: FontWeight.bold,
                                font_size: Colors_and_Dimentions.fontsize_12,
                                text_color: Colors_and_Dimentions.fontcolor2,
                              ),
                              SizedBox(
                                height: Colors_and_Dimentions.Hight_16,
                              ),
                              FP_textSTyle(
                                text_content: '????????????',
                                font_weight: FontWeight.bold,
                                font_size: Colors_and_Dimentions.fontsize_12,
                                text_color: Colors_and_Dimentions.fontcolor2,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              FP_textSTyle(
                                text_content: widget.tailor_locatioShow,
                                font_size: Colors_and_Dimentions.fontsize_12,
                                text_color: Colors_and_Dimentions.fontcolor2,
                              ),
                              const SizedBox(
                                height: Colors_and_Dimentions.Hight_16,
                              ),
                              FP_textSTyle(
                                text_content: widget.tailor_worktimeShow,
                                font_size: Colors_and_Dimentions.fontsize_12,
                                text_color: Colors_and_Dimentions.fontcolor2,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            children: const [
                              FP_textSTyle(
                                text_content: '????????????',
                                font_weight: FontWeight.bold,
                                font_size: Colors_and_Dimentions.fontsize_12,
                                text_color: Colors_and_Dimentions.fontcolor2,
                              ),
                              SizedBox(
                                height: Colors_and_Dimentions.Hight_16,
                              ),
                              FP_textSTyle(
                                text_content: '?????? ??????????????',
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
                  const SizedBox(
                    height: 32,
                  ),

                  /// ???????? ????????????
                  Container(
                    color: const Color.fromARGB(38, 121, 103, 99),
                    height: 1,
                  ),
                  SizedBox(
                    height: 600,
                    child: ListView(
                      children: [
                        for (var qumash in qumashs)
                          InkWell(
                              onTap: () {
                                final CollectionReference collectionRef =
                                    FirebaseFirestore.instance.collection('order_details');

                                collectionRef.doc('$_uid').set({
                                  'id': '',
                                  'tailor': widget.tailor_nameShow,
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
                              child: Column(
                                children: [
                                  Qumash_Card(qumash: qumash),
                                ],
                              ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
