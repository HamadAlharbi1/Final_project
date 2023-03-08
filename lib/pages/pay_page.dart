import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/Tafseel_Detail.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/combonents/img_container.dart';
import 'package:final_project/pages/after_pay_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../combonents/Drawer/DrawerWidget.dart';

class pay_page extends StatefulWidget {
  const pay_page({super.key});

  @override
  State<pay_page> createState() => _pay_pageState();
}

class _pay_pageState extends State<pay_page> {
  StreamSubscription? listener_of_T_Details;

  List<Tafseel_Details> T_Details = [];

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

  var _uid;
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    _uid = user!.uid;
    dateinput.text = "";
    super.initState();
    listener_of_T_Details?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    const usr = '';
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
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                // Row(
                //   children: [
                //     InkWell(
                //         onTap: () {
                //           showDialog(
                //             context: context,
                //             builder: (context) {
                //               return AlertDialog(
                //                 actions: [
                //                   Row(
                //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                     children: [
                //                       InkWell(
                //                         onTap: () {
                //                           setState(() {});
                //                           FirebaseFirestore.instance
                //                               .collection('cart_content')
                //                               .doc(widget.c.id.toString())
                //                               .delete();
                //                           Navigator.pop(
                //                             context,
                //                           );
                //                         },
                //                         child: Container(
                //                             alignment: Alignment.center,
                //                             padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                //                             decoration: BoxDecoration(
                //                               borderRadius: BorderRadius.circular(12),
                //                               color: Colors_and_Dimentions.containercolor,
                //                             ),
                //                             child: const FP_textSTyle(
                //                               text_content: 'نعم',
                //                               text_color: Colors_and_Dimentions.fontcolor,
                //                             )),
                //                       ),
                //                       InkWell(
                //                         onTap: () {
                //                           Navigator.pop(context);
                //                         },
                //                         child: Container(
                //                             alignment: Alignment.center,
                //                             padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                //                             decoration: BoxDecoration(
                //                               borderRadius: BorderRadius.circular(12),
                //                               color: Colors_and_Dimentions.containercolor,
                //                             ),
                //                             child: const FP_textSTyle(
                //                               text_content: 'لا',
                //                               text_color: Colors_and_Dimentions.fontcolor,
                //                             )),
                //                       ),
                //                     ],
                //                   ),
                //                 ],
                //                 title: const Text(
                //                   'هل تريد الحذف من السلة   ',
                //                   style: TextStyle(color: Colors_and_Dimentions.fontcolor2),
                //                 ),
                //                 backgroundColor: Colors_and_Dimentions.main_continer_color,
                //               );
                //             },
                //           );
                //         },
                //         child: const Icon(
                //           Icons.cancel_outlined,
                //           size: 20,
                //         ))
                //   ],
                // ),

                for (var i in T_Details)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [FP_textSTyle(text_content: '44')],
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              height: 420,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                gradient: const LinearGradient(
                  colors: [
                    // Color.fromARGB(255, 9, 37, 244),
                    // Color.fromARGB(255, 0, 7, 111),
                    Color.fromARGB(255, 75, 33, 33),
                    Color.fromARGB(255, 142, 63, 63)
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Card Number',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: const CustomTextField(hint: 'XXXX-XXXX-XXXX-XXXX'),
                  ),
                  const Text(
                    'Cardholder Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: const CustomTextField(hint: 'XXXX-XXXX-XXXX-XXXX'),
                  ),
                  const Text(
                    'Expire Date',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: const CustomTextField(hint: 'MM/DD/yyyy'),
                  ),
                  // TextField(
                  //   controller: dateinput, //editing controller of this TextField
                  //   decoration: const InputDecoration(
                  //       icon: Icon(Icons.calendar_today), //icon of text field
                  //       labelText: "Enter Date" //label text of field
                  //       ),
                  //   readOnly: true,
                  //   onTap: () async {
                  //     DateTime? pickedDate = await showDatePicker(
                  //         context: context,
                  //         initialDate: DateTime.now(),
                  //         firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                  //         lastDate: DateTime(2101));

                  //     if (pickedDate != null) {
                  //       print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  //       String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                  //       print(formattedDate); //formatted date output using intl package =>  2021-03-16
                  //       //you can implement different kind of Date Format here according to your requirement

                  //       setState(() {
                  //         dateinput.text = formattedDate; //set output date to TextField value.
                  //       });
                  //     } else {
                  //       print("Date is not selected");
                  //     }
                  //   },
                  // ),

                  // Container(
                  //   color: Colors.white,
                  //   child: const CustomTextField(hint: 'MM/DD/YYYY'),
                  // ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors_and_Dimentions.main_continer_color),
                    ),
                    onPressed: () {
                      CollectionReference cartRef2 = FirebaseFirestore.instance.collection('cart_content');
                      CollectionReference ordersRef = FirebaseFirestore.instance.collection('_orders');

                      cartRef2.get().then((querySnapshot) {
                        for (var doc in querySnapshot.docs) {
                          ordersRef.doc(doc.id).set(doc.data());
                        }
                      });
                      CollectionReference cartRef = FirebaseFirestore.instance.collection('cart_content');
                      FirebaseFirestore.instance.collection('order_details').doc('$_uid').delete();
                      cartRef.get().then((querySnapshot) {
                        for (var doc in querySnapshot.docs) {
                          doc.reference.delete();
                        }
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const after_pay(), // pass the document ID to the next page
                        ),
                      );
                    },
                    child: const FP_textSTyle(
                      text_content: '  حفظ ',
                      font_weight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.hint,
    super.key,
  });
  final String hint;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.grey),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        letterSpacing: 4.0,
        fontFamily: 'RobotoMono',
      ),
    );
  }
}
