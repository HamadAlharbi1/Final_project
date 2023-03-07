import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/combonents/tafseel_details.dart';
import 'package:final_project/pages/tafseel_details/6tadrizestyle.dart';
import 'package:flutter/material.dart';

class Tallstyle extends StatelessWidget {
  const Tallstyle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_and_Dimentions.BK_color,
      body: tafseel_details(
        D_1: 'طبيعي',
        D_2: 'منسدل',
        MY_ontap1: () {
          final CollectionReference collectionRef = FirebaseFirestore.instance.collection('order_details');

          collectionRef
              .doc('1')
              .update({
                'Tallstyle': 'طبيعي',
              })
              .then((value) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const tadrizestyle(),
                    ),
                  ))
              .catchError((error) => print('Failed to update document: $error'));
        },
        MY_ontap2: () {
          final CollectionReference collectionRef = FirebaseFirestore.instance.collection('order_details');

          collectionRef
              .doc('1')
              .update({
                'Tallstyle': 'منسدل',
              })
              .then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const tadrizestyle(),
                    ),
                  ))
              .catchError((error) => print('Failed to update document: $error'));
        },
        title: 'اختر  الطول',
        image_1: 'https://media.discordapp.net/attachments/1081328393364189276/1082038877847552171/image_25.png',
        image_2: 'https://cdn.discordapp.com/attachments/1081328393364189276/1082038877499429115/image_26.png',
      ),
    );
  }
}
