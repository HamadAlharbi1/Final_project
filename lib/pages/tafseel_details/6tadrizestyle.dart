import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/Tafseel_Detail.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/combonents/Drawer/DrawerWidget.dart';
import 'package:final_project/combonents/tafseel_details.dart';
import 'package:final_project/pages/Cart_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    _uid = user!.uid;
    super.initState();

    listenToT_Details();
  }

  var _uid;

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 0, 0, 0).withOpacity(0.1),
        centerTitle: true,
        title: Image.network(
          'https://cdn.discordapp.com/attachments/1081328393364189276/1082219855991803984/image_146.png',
          fit: BoxFit.contain,
        ),
      ),
      endDrawer: const DrawerWidget(),
      body: ListView(
        children: [
          tafseel_details(
            D_1: 'بدون تطريز',
            D_2: 'خطوط مستقيمة',
            MY_ontap1: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CartPage(), // pass the document ID to the next page
                                ),
                              );

                              //        FirebaseFirestore.instance.collection('order_details').doc('$_uid').delete();
                            },
                            child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors_and_Dimentions.containercolor,
                                ),
                                child: const FP_textSTyle(
                                  text_content: 'نعم',
                                  text_color: Colors_and_Dimentions.fontcolor,
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors_and_Dimentions.containercolor,
                                ),
                                child: const FP_textSTyle(
                                  text_content: 'لا',
                                  text_color: Colors_and_Dimentions.fontcolor,
                                )),
                          ),
                        ],
                      ),
                    ],
                    title: const Text(
                      ' هل تريد الانتقال الى السلة ',
                      style: TextStyle(color: Colors_and_Dimentions.fontcolor2),
                    ),
                    backgroundColor: Colors_and_Dimentions.main_continer_color,
                  );
                },
              );
              final DocumentReference sourceDocRef =
                  FirebaseFirestore.instance.collection('order_details').doc('$_uid');
              final DocumentReference destDocRef = FirebaseFirestore.instance.collection('cart_content').doc();

              sourceDocRef.get().then((DocumentSnapshot snapshot) {
                if (snapshot.exists) {
                  destDocRef.set(snapshot.data());
                }
              });
              final CollectionReference collectionRef = FirebaseFirestore.instance.collection('order_details');
              collectionRef
                  .doc('$_uid')
                  .update({
                    'tadrizestyle': 'بدون تطريز',
                  })
                  .then((value) {})
                  .catchError((error) => print('Failed to update document: $error'));
            },
            MY_ontap2: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CartPage(), // pass the document ID to the next page
                                ),
                              );

                              //      FirebaseFirestore.instance.collection('order_details').doc('$_uid').delete();
                            },
                            child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors_and_Dimentions.containercolor,
                                ),
                                child: const FP_textSTyle(
                                  text_content: 'نعم',
                                  text_color: Colors_and_Dimentions.fontcolor,
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors_and_Dimentions.containercolor,
                                ),
                                child: const FP_textSTyle(
                                  text_content: 'لا',
                                  text_color: Colors_and_Dimentions.fontcolor,
                                )),
                          ),
                        ],
                      ),
                    ],
                    title: const Text(
                      ' هل تريد الانتقال الى السلة ',
                      style: TextStyle(color: Colors_and_Dimentions.fontcolor2),
                    ),
                    backgroundColor: Colors_and_Dimentions.main_continer_color,
                  );
                },
              );
              final DocumentReference sourceDocRef =
                  FirebaseFirestore.instance.collection('order_details').doc('$_uid');
              final DocumentReference destDocRef = FirebaseFirestore.instance.collection('cart_content').doc();

              sourceDocRef.get().then((DocumentSnapshot snapshot) {
                if (snapshot.exists) {
                  destDocRef.set(snapshot.data());
                }
              });
              final CollectionReference collectionRef = FirebaseFirestore.instance.collection('order_details');
              collectionRef
                  .doc('$_uid')
                  .update({
                    'tadrizestyle': 'خطوط مستقيمة',
                  })
                  .then((value) {})
                  .catchError((error) => print('Failed to update document: $error'));
            },
            title: 'اختر  التطريز',
            image_1: 'https://cdn.discordapp.com/attachments/1081328393364189276/1082041116083376128/image_27.png',
            image_2: 'https://cdn.discordapp.com/attachments/1081328393364189276/1082041115869454416/image_28.png',
          ),
        ],
      ),
    );
  }
}
