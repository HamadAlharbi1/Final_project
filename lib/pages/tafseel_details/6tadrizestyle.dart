import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/Tafseel_Detail.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/combonents/tafseel_details.dart';
import 'package:final_project/pages/Orders_Pages.dart';
import 'package:flutter/material.dart';

import '../../combonents/Drawer/DrawerWidget.dart';

class tadrizestyle extends StatefulWidget {
  const tadrizestyle({
    super.key,
  });

  @override
  State<tadrizestyle> createState() => _tadrizestyleState();
}

class _tadrizestyleState extends State<tadrizestyle> {
  StreamSubscription? listener_of_T_Details;

  List<Tafseel_Details> T_Details = [];

  @override
  void initState() {
    listener_of_T_Details?.cancel();

    super.initState();

    listenToT_Details();
  }

  listenToT_Details() {
    listener_of_T_Details ??= FirebaseFirestore.instance.collection('order_details').snapshots().listen((collection) {
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
      backgroundColor: Colors_and_Dimentions.BK_color,
      body: tafseel_details(
        D_1: 'بدون تطريز',
        D_2: 'خطوط مستقيمة',
        MY_ontap1: () {
          final CollectionReference collectionRef = FirebaseFirestore.instance.collection('order_details');
          collectionRef
              .doc('1')
              .update({
                'tadrizestyle': 'بدون تطريز',
              })
              .then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const after_TD(),
                    ),
                  ))
              .catchError((error) => print('Failed to update document: $error'));
        },
        MY_ontap2: () {
          final CollectionReference collectionRef = FirebaseFirestore.instance.collection('order_details');
          collectionRef
              .doc('1')
              .update({
                'tadrizestyle': 'خطوط مستقيمة',
              })
              .then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const after_TD(),
                    ),
                  ))
              .catchError((error) => print('Failed to update document: $error'));
        },
        title: 'اختر  التطريز',
        image_1: 'https://cdn.discordapp.com/attachments/1081328393364189276/1082041116083376128/image_27.png',
        image_2: 'https://cdn.discordapp.com/attachments/1081328393364189276/1082041115869454416/image_28.png',
      ),
    );
  }
}
