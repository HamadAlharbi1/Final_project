import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/combonents/tafseel_details.dart';
import 'package:final_project/pages/tafseel_details/2jubzor.dart';
import 'package:flutter/material.dart';

class Yaqa extends StatefulWidget {
  const Yaqa({
    super.key,
  });

  @override
  State<Yaqa> createState() => _YaqaState();
}

class _YaqaState extends State<Yaqa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_and_Dimentions.BK_color,
      body: tafseel_details(
        D_1: 'ساده',
        D_2: 'قلابي',
        MY_ontap1: () {
          final CollectionReference collectionRef = FirebaseFirestore.instance.collection('order_details');
          collectionRef
              .doc('1')
              .update({
                'Yaqa': 'ساده',
              })
              .then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Jubzor(),
                    ),
                  ))
              .catchError((error) => print('Failed to update document: $error'));
        },
        MY_ontap2: () {
          final CollectionReference collectionRef = FirebaseFirestore.instance.collection('order_details');

          collectionRef
              .doc('1')
              .update({
                'Yaqa': 'قلابي',
              })
              .then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Jubzor(),
                    ),
                  ))
              .catchError((error) => print('Failed to update document: $error'));
        },
        title: 'اختر  الياقه',
        image_1: 'https://cdn.discordapp.com/attachments/1081328393364189276/1082047587173015562/image_8.png',
        image_2: 'https://media.discordapp.net/attachments/1081328393364189276/1081637367120666725/IMG_2808.png',
      ),
    );
  }
}
