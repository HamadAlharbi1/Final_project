import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/CartCardWidget/CartCardWidget.dart';
import 'package:final_project/pages/Home_Page.dart';
import 'package:final_project/pages/fill_new_maqas.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../combonents/Constants/constants.dart';
import '../combonents/Drawer/DrawerWidget.dart';

class Maqasaty extends StatefulWidget {
  const Maqasaty({super.key});

  @override
  State<Maqasaty> createState() => _MaqasatyState();
}

class _MaqasatyState extends State<Maqasaty> {
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
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).padding.top, 56),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 10),
            child: AppBar(
              leading: Row(
                children: [
                  SizedBox(
                    width: 4,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const fillNewMaqas();
                        }));
                      },
                      child: const Icon(Icons.add)),
                  SizedBox(
                    width: 4,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }));
                      },
                      child: Icon(Icons.home)),
                ],
              ),
              automaticallyImplyLeading: false,
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
      endDrawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Maqasat').where('uploadedBy', isEqualTo: '$_uid').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.active) {
              {
                if (snapshot.data!.docs.isNotEmpty) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pop(context, true);
                            Navigator.pop(context, true);
                            context.findAncestorStateOfType<CardCartWidgetState>()?.isChecked = true;
                            context.findAncestorStateOfType<CardCartWidgetState>()?.setState(() {});
                            ;
                          },
                          child: maqasaty_card(
                            maqasid: snapshot.data!.docs[index]['maqasid'],
                            meger_nameShow: snapshot.data!.docs[index]['megerName'],
                            tall_show: snapshot.data!.docs[index]['tall'],
                            uploadedBy_show: snapshot.data!.docs[index]['uploadedBy'],
                            neck_weidthSow: snapshot.data!.docs[index]['neckWeidth'],
                            shoulder_weidthShow: snapshot.data!.docs[index]['shoulderWeidth'],
                            chest_weidthShow: snapshot.data!.docs[index]['chestWeidth'],
                            km_tallShow: snapshot.data!.docs[index]['kmTall'],
                          ),
                        );
                      });
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.search_off,
                            color: Colors.white,
                          ),
                          Center(
                            child: Text(
                              'لاتوجد مقاسات',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
              }
            }
            return const Text('somthing went wrong');
          },
        ),
      ),
    );
  }
}

class maqasaty_card extends StatefulWidget {
  final String maqasid;
  final String meger_nameShow;
  final String tall_show;
  final String neck_weidthSow;
  final String shoulder_weidthShow;
  final String chest_weidthShow;
  final String uploadedBy_show;
  final String km_tallShow;
  const maqasaty_card({
    super.key,
    required this.meger_nameShow,
    required this.tall_show,
    required this.neck_weidthSow,
    required this.shoulder_weidthShow,
    required this.chest_weidthShow,
    required this.uploadedBy_show,
    required this.km_tallShow,
    required this.maqasid,
  });

  @override
  State<maqasaty_card> createState() => _maqasaty_cardState();
}

class _maqasaty_cardState extends State<maqasaty_card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 1)]),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  ShowDialogFunction3(context);
                },
                child: const Text(
                  'حذف',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Text(
                widget.meger_nameShow ?? '',
                style: const TextStyle(
                  color: Colors_and_Dimentions.font_color,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(
                flex: 2,
              )
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.tall_show ?? '',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors_and_Dimentions.font_color),
              ),
              const Text(
                ':الطول',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors_and_Dimentions.font_color),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.neck_weidthSow ?? '',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors_and_Dimentions.font_color),
              ),
              const Text(
                ':عرض الرقبة',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors_and_Dimentions.font_color),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.shoulder_weidthShow ?? '',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors_and_Dimentions.font_color),
              ),
              const Text(
                ':عرض الكتف',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors_and_Dimentions.font_color),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.chest_weidthShow ?? '',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors_and_Dimentions.font_color),
              ),
              const Text(
                ':عرض الصدر',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors_and_Dimentions.font_color),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.km_tallShow ?? '',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors_and_Dimentions.font_color),
              ),
              const Text(
                ':طول الكم',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors_and_Dimentions.font_color),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }

  void ShowDialogFunction3(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'هل انت متأكد ؟',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 34, 58, 59),
                fontFamily: 'JosefinSans',
                fontSize: 20,
              ),
            ),
            content: const SizedBox(
              width: 100,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {});
                    FirebaseFirestore.instance.collection('Maqasat').doc(widget.maqasid).delete();
                    Navigator.pop(context);
                    Fluttertoast.showToast(
                        msg: "The task  delete successfully",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        textColor: const Color.fromARGB(255, 255, 255, 255),
                        timeInSecForIosWeb: 4,
                        fontSize: 16.0);
                  },
                  child: const Text(
                    'حذف',
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'إلغاء',
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          );
        });
  }
}
