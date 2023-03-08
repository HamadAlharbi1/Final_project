import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/Tafseel_Detail.dart';
import 'package:final_project/pages/Home_Page.dart';
import 'package:flutter/material.dart';

import '../combonents/CartCardWidget/CartCardWidget.dart';
import '../combonents/Constants/constants.dart';
import '../combonents/Drawer/DrawerWidget.dart';
import '../combonents/PriceDetailWidget/PriceDetailWidget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  StreamSubscription? listener_of_T_Details;

  List<Tafseel_Details> T_Details = [];

  @override
  void initState() {
    listener_of_T_Details?.cancel();

    super.initState();

    listenToT_Details();
  }

  listenToT_Details() {
    listener_of_T_Details ??= FirebaseFirestore.instance.collection('cart_content').snapshots().listen((collection) {
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors_and_Dimentions.icon_color,
        centerTitle: true,
        title: Image.network(
          'https://cdn.discordapp.com/attachments/1081328393364189276/1082219855991803984/image_146.png',
          fit: BoxFit.contain,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
      ),
      //drawer
      endDrawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          height: 900,
          child: ListView(
            children: [
              for (var c in T_Details)
                CardCartWidget(
                  c: c,
                ),
              const PriceDetailWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
