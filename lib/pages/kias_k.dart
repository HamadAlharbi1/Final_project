import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/Tafseel_Detail.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/combonents/img_container.dart';
import 'package:final_project/pages/Cart_Page.dart';
import 'package:flutter/material.dart';

import '../combonents/Drawer/DrawerWidget.dart';

class qyas_khiadhti extends StatefulWidget {
  const qyas_khiadhti({super.key});

  @override
  State<qyas_khiadhti> createState() => _after_TDState();
}

class _after_TDState extends State<qyas_khiadhti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors_and_Dimentions.BK_color,
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
          Column(
            children: [
              SizedBox(
                height: 200,
              ),
              FP_textSTyle(
                text_content: 'ادخل رقم الهاتف ليتم التواصل معك ',
                font_weight: FontWeight.bold,
                font_size: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 35, 35, 35).withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ], borderRadius: BorderRadius.circular(12), color: Colors_and_Dimentions.main_continer_color),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: TextField(),
                        height: 200,
                        width: 300,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors_and_Dimentions.main_continer_color),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(), // pass the document ID to the next page
                    ),
                  );
                },
                child: const FP_textSTyle(
                  text_content: '  حفظ ',
                  font_weight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
