import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/tafseel_details.dart';
import 'package:final_project/pages/tafseel_details/4kabak.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../combonents/Constants/constants.dart';
import '../../combonents/Drawer/DrawerWidget.dart';

class Zorar extends StatefulWidget {
  const Zorar({
    super.key,
  });

  @override
  State<Zorar> createState() => _ZorarState();
}

class _ZorarState extends State<Zorar> {
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
      // backgroundColor: Colors_and_Dimentions.BK_color,
      //backgroundColor: Colors_and_Dimentions.icon_color,
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
          tafseel_details(
            D_1: 'ظاهر',
            D_2: 'مخفي',
            MY_ontap1: () {
              final CollectionReference collectionRef = FirebaseFirestore.instance.collection('order_details');

              collectionRef
                  .doc('$_uid')
                  .update({
                    'Zorar': 'ظاهر',
                  })
                  .then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Kapak(),
                        ),
                      ))
                  .catchError((error) => print('Failed to update document: $error'));
            },
            MY_ontap2: () {
              final CollectionReference collectionRef = FirebaseFirestore.instance.collection('order_details');

              collectionRef
                  .doc('$_uid')
                  .update({
                    'Zorar': 'مخفي',
                  })
                  .then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Kapak(),
                        ),
                      ))
                  .catchError((error) => print('Failed to update document: $error'));
            },
            title: 'اختر نوع الزرار',
            image_1: 'https://cdn.discordapp.com/attachments/1081328393364189276/1082036072277627044/image_21.png',
            image_2: 'https://cdn.discordapp.com/attachments/1081328393364189276/1082036072021753906/image_22.png',
          ),
        ],
      ),
    );
  }
}
