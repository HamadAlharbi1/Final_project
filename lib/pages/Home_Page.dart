import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/Qumash_Details_modols.dart';
import 'package:final_project/combonents/Constants/Tailor_Details_modols.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/combonents/Qumash_Card.dart';
import 'package:final_project/combonents/Tailor_Card.dart';
import 'package:final_project/pages/Tailor_Details_Page.dart';
import 'package:flutter/material.dart';

import '../combonents/Drawer/DrawerWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamSubscription? listener_of_Tailors;
  StreamSubscription? listener_of_Qumashs;
  List<Tailor_Details> tailors = [];
  List<Qumash_Details> qumashs = [];
  @override
  void initState() {
    listener_of_Tailors?.cancel();
    listener_of_Qumashs?.cancel();
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
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          height: 900,
          child: ListView(
            children: [
              for (var i in tailors)
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Tailor_Details_Page(tailor: i)),
                    );
                  },
                  child: Tailor_Card(
                    item: i,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
