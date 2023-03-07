import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/combonents/tafseel_details.dart';
import 'package:final_project/pages/tafseel_details/5tallstyle.dart';
import 'package:flutter/material.dart';

class Kapak extends StatelessWidget {
  const Kapak({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_and_Dimentions.BK_color,
      body: tafseel_details(
        D_1: 'ساده',
        D_2: 'كبك',
        MY_ontap1: () {
          final CollectionReference collectionRef = FirebaseFirestore.instance.collection('order_details');

          collectionRef
              .doc('1')
              .update({
                'Kapak': 'ساده',
              })
              .then((value) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Tallstyle(),
                    ),
                  ))
              .catchError((error) => print('Failed to update document: $error'));
        },
        MY_ontap2: () {
          final CollectionReference collectionRef = FirebaseFirestore.instance.collection('order_details');

          collectionRef
              .doc('1')
              .update({
                'Kapak': 'كبك',
              })
              .then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Tallstyle(),
                    ),
                  ))
              .catchError((error) => print('Failed to update document: $error'));
        },
        title: 'اختر  كبك',
        image_1: 'https://cdn.discordapp.com/attachments/1081328393364189276/1082037639181512774/image_23.png',
        image_2: 'https://cdn.discordapp.com/attachments/1081328393364189276/1082037639001149500/image_24.png',
      ),
    );
  }
}
