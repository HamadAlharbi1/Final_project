import 'dart:ui';

import 'package:final_project/pages/fill_new_maqas.dart';
import 'package:flutter/material.dart';

import '../combonents/Constants/constants.dart';

class Maqasaty extends StatefulWidget {
  const Maqasaty({super.key});

  @override
  State<Maqasaty> createState() => _MaqasatyState();
}

class _MaqasatyState extends State<Maqasaty> {
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
              leading: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return fillNewMaqas();
                    }));
                  },
                  child: Icon(Icons.add)),
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
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 1)]),
              width: double.infinity,
              child: const Column(
                children: [
                  Text(
                    'اسم المقاس',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Text(' عرض الرقبة'), Text('الطول')],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Text('عرض الكتف'), Text(' عرض الصدر ')],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Text('طول الكم')],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
