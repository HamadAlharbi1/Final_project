import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/combonents/tafseel_details.dart';
import 'package:final_project/pages/tafseel_details/6tadrizestyle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../combonents/Drawer/DrawerWidget.dart';

class Tallstyle extends StatefulWidget {
  const Tallstyle({
    super.key,
  });

  @override
  State<Tallstyle> createState() => _TallstyleState();
}

class _TallstyleState extends State<Tallstyle> {
  var _uid;
  @override
  void initState() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    _uid = user!.uid;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_and_Dimentions.BK_color,
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
          tafseel_details(
            D_1: 'طبيعي',
            D_2: 'منسدل',
            MY_ontap1: () {
              final CollectionReference collectionRef = FirebaseFirestore.instance.collection('order_details');

              collectionRef
                  .doc('$_uid')
                  .update({
                    'Tallstyle': 'طبيعي',
                  })
                  .then((value) => Navigator.push(
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
                  .doc('$_uid')
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
        ],
      ),
    );
  }
}
