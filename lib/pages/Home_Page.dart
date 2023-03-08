import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/Qumash_Details_modols.dart';
import 'package:final_project/combonents/Constants/Tailor_Details_modols.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/combonents/Tailor_Card.dart';
import 'package:flutter/material.dart';

import '../combonents/Drawer/DrawerWidget.dart';
import 'Cart_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> CityList = ['الدمام', 'ينبع', 'المدينة', 'الرياض'];

  String? categoryfilter1;

  StreamSubscription? listener_of_Tailors;
  StreamSubscription? listener_of_Qumashs;
  List<Tailor_Details> tailors = [];
  List<Qumash_Details> qumashs = [];
  @override
  void initState() {
    listener_of_Tailors?.cancel();
    listener_of_Qumashs?.cancel();
    super.initState();
    // listenToQumashs();
  }

  // listenToTailors() {
  //   listener_of_Tailors ??= FirebaseFirestore.instance
  //       .collection('List_of_Tailors')
  //       .where('location', isEqualTo: 'ينبع')
  //       .snapshots()
  //       .listen((collection) {
  //     List<Tailor_Details> newList = [];
  //     for (final doc in collection.docs) {
  //       final tailor = Tailor_Details.fromMap(doc.data());
  //       newList.add(tailor);
  //     }
  //     tailors = newList;
  //     setState(() {});
  //   });
  // }

  // listenToQumashs() {
  //   listener_of_Qumashs ??= FirebaseFirestore.instance.collection('List_of_Qumashs').snapshots().listen((collection) {
  //     List<Qumash_Details> newList = [];
  //     for (final doc in collection.docs) {
  //       final qumash = Qumash_Details.fromMap(doc.data());
  //       newList.add(qumash);
  //     }
  //     qumashs = newList;
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.filter_list_sharp),
              color: Colors_and_Dimentions.icon_color,
              onPressed: () {
                ShowFilterDialog(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Colors_and_Dimentions.icon_color,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              },
            ),
          ],
        ),
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('List_of_Tailors')
            .where('location', isEqualTo: categoryfilter1)
            .snapshots(),
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
                      return Tailor_Card(
                        tailor_name: snapshot.data!.docs[index]['Tailor_name'],
                        tailor_rate: snapshot.data!.docs[index]['Rate'],
                        location: snapshot.data!.docs[index]['location'],
                        img: snapshot.data!.docs[index]['Image_URL'],
                        tailor_availabilty: snapshot.data!.docs[index]
                            ['The_ability'],
                        tailor_worktime: snapshot.data!.docs[index]
                            ['avarge_period'],
                        google_map: snapshot.data!.docs[index]['more_details2'],
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
                          color: Colors_and_Dimentions.fontcolor,
                        ),
                        Center(
                          child: Text(
                            'لا يوجد خياطين في هذه المدينة',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors_and_Dimentions.fontcolor,
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
    );
  }

  ShowFilterDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'اختر المدينة ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors_and_Dimentions.fontcolor,
                    fontFamily: 'JosefinSans',
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            content: SizedBox(
              width: 100,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: CityList.length,
                  itemBuilder: (contex, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          categoryfilter1 = CityList[index];
                          print(categoryfilter1!);
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            width: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: Text(
                              CityList[index],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    categoryfilter1 = null;
                    print(categoryfilter1);
                  });
                },
                child: const Text(
                  'إلغاء الفلتر',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'إغلاق',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          );
        });
  }
}
