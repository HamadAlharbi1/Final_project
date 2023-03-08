import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/combonents/text_field1.dart';
import 'package:final_project/pages/maqasaty.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

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
    meger_name.dispose();
    tall.dispose();
    neck_weidth.dispose();
    shoulder_weidth.dispose();
    chest_weidth.dispose();
    km_tall.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
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
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_forward_ios, color: Colors.white),
                  ),
                )
              ],
              elevation: 0,
              backgroundColor: Colors_and_Dimentions.icon_color,
              centerTitle: true,
              title: Image.network(
                'https://cdn.discordapp.com/attachments/1081328393364189276/1082219855991803984/image_146.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'يرجى ادخال تفاصيل القياس ',
                  style: TextStyle(
                    color: Colors_and_Dimentions.font_color,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '(cm) جميع المقاسات تؤخذ بوحدة ',
                  style: TextStyle(
                    color: Colors_and_Dimentions.font_color,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField1(
                    Enable: true, secure_text: false, controll: meger_name, isFocused: false, hint1: '*اسم المقاس'),
                const SizedBox(
                  height: 12,
                ),
                TextField1(Enable: true, secure_text: false, controll: tall, isFocused: false, hint1: '*الطول'),
                const SizedBox(
                  height: 12,
                ),
                TextField1(
                    Enable: true, secure_text: false, controll: neck_weidth, isFocused: false, hint1: '*عرض الرقبة'),
                const SizedBox(
                  height: 12,
                ),
                TextField1(
                    Enable: true, secure_text: false, controll: shoulder_weidth, isFocused: false, hint1: '*عرض الكتف'),
                const SizedBox(
                  height: 12,
                ),
                TextField1(
                    Enable: true, secure_text: false, controll: chest_weidth, isFocused: false, hint1: '*عرض الصدر'),
                const SizedBox(
                  height: 12,
                ),
                TextField1(Enable: true, secure_text: false, controll: km_tall, isFocused: false, hint1: '*طول الكم'),
                const SizedBox(
                  height: 22,
                ),
                InkWell(
                  onTap: () async {
                    if (meger_name.text.isEmpty ||
                        tall.text.isEmpty ||
                        neck_weidth.text.isEmpty ||
                        shoulder_weidth.text.isEmpty ||
                        chest_weidth.text.isEmpty ||
                        km_tall.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "الرجاء إدخال جميع القيم",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 5,
                          webBgColor: 'linear-gradient(to right, #DE9905, #EFB947)',
                          fontSize: 16.0);
                    } else {
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      User? user = auth.currentUser;
                      String uid = user!.uid;
                      final maqasid = const Uuid().v4();
                      await FirebaseFirestore.instance.collection('Maqasat').doc(maqasid).set({
                        'maqasid': maqasid,
                        'uploadedBy': uid,
                        'megerName': meger_name.text,
                        'tall': tall.text,
                        'neckWeidth': neck_weidth.text,
                        'shoulderWeidth': shoulder_weidth.text,
                        'chestWeidth': chest_weidth.text,
                        'kmTall': km_tall.text,
                      });
                      Fluttertoast.showToast(
                          msg: "تم الحفظ بنجاح",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 5,
                          webBgColor: 'linear-gradient(to right, #35B529, #35B529)',
                          fontSize: 16.0);
                      setState(() {
                        meger_name.clear();
                        tall.clear();
                        neck_weidth.clear();
                        shoulder_weidth.clear();
                        chest_weidth.clear();
                        km_tall.clear();
                      });
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return const Maqasaty();
                      }));
                    }
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
          ),
        ],
      ),
    );
  }
}
