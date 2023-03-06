import 'dart:ui';

import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/combonents/text_field1.dart';
import 'package:final_project/pages/maqasaty.dart';
import 'package:flutter/material.dart';

class fillNewMaqas extends StatefulWidget {
  const fillNewMaqas({super.key});

  @override
  State<fillNewMaqas> createState() => _fillNewMaqasState();
}

class _fillNewMaqasState extends State<fillNewMaqas> {
  final meger_name = TextEditingController();
  final tall = TextEditingController();
  final neck_weidth = TextEditingController();
  final shoulder_weidth = TextEditingController();
  final chest_weidth = TextEditingController();
  final km_tall = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffeaeaea),
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).padding.top, 56),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 10),
            child: AppBar(
              automaticallyImplyLeading: false,
              actions: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors_and_Dimentions.icon_color,
                    ),
                  ),
                )
              ],
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 0, 0, 0).withOpacity(0.1),
              centerTitle: true,
              title: Image.network(
                'https://cdn.discordapp.com/attachments/1081328393364189276/1082219855991803984/image_146.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          TextField1(Enable: true, secure_text: false, controll: meger_name, isFocused: false, hint1: 'اسم المقاس'),
          const SizedBox(
            height: 12,
          ),
          TextField1(Enable: true, secure_text: false, controll: tall, isFocused: false, hint1: ' الطول'),
          const SizedBox(
            height: 12,
          ),
          TextField1(Enable: true, secure_text: false, controll: neck_weidth, isFocused: false, hint1: ' عرض الرقبة'),
          const SizedBox(
            height: 12,
          ),
          TextField1(
              Enable: true, secure_text: false, controll: shoulder_weidth, isFocused: false, hint1: ' عرض الكتف'),
          const SizedBox(
            height: 12,
          ),
          TextField1(Enable: true, secure_text: false, controll: chest_weidth, isFocused: false, hint1: ' عرض الصدر'),
          const SizedBox(
            height: 12,
          ),
          TextField1(Enable: true, secure_text: false, controll: km_tall, isFocused: false, hint1: ' طول الكم'),
          const SizedBox(
            height: 22,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Maqasaty();
              }));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 36),
              alignment: Alignment.center,
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34),
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xff796763), Color.fromARGB(255, 94, 79, 76)])),
              child: const Text(
                'حفظ',
                style: TextStyle(
                  fontFamily: 'JosefinSans',
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
