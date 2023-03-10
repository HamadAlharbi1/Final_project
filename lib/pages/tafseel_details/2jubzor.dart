import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/tafseel_details.dart';
import 'package:final_project/pages/tafseel_details/3zorar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../combonents/Constants/constants.dart';
import '../../combonents/Drawer/DrawerWidget.dart';

class Jubzor extends StatefulWidget {
  const Jubzor({
    super.key,
  });

  @override
  State<Jubzor> createState() => _JubzorState();
}

class _JubzorState extends State<Jubzor> {
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
      //backgroundColor: Colors_and_Dimentions.BK_color,
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
            D_1: 'مربع',
            D_2: 'دائري',
            MY_ontap1: () {
              final CollectionReference collectionRef = FirebaseFirestore.instance.collection('order_details');

              collectionRef
                  .doc('$_uid')
                  .update({
                    'Jubzor': 'مربع',
                  })
                  .then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Zorar(),
                        ),
                      ))
                  .catchError((error) => print('Failed to update document: $error'));
            },
            MY_ontap2: () {
              final CollectionReference collectionRef = FirebaseFirestore.instance.collection('order_details');

              collectionRef
                  .doc('$_uid')
                  .update({
                    'Jubzor': 'دائري',
                  })
                  .then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Zorar(),
                        ),
                      ))
                  .catchError((error) => print('Failed to update document: $error'));
            },
            title: 'اختر الجبزور',
            image_1: 'https://cdn.discordapp.com/attachments/1081328393364189276/1082034507517005904/image_18.png',
            image_2: 'https://cdn.discordapp.com/attachments/1081328393364189276/1082034507718328370/image_20.png',
          ),
        ],
      ),
    );
  }
}
