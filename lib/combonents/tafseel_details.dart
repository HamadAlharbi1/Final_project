import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/pages/Home_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class tafseel_details extends StatefulWidget {
  final String title;
  void Function()? MY_ontap1;
  void Function()? MY_ontap2;
  void Function()? MY_ontap3;
  final String image_1;
  final String image_2;
  final String D_1;
  final String D_2;
  final String image_3;

  tafseel_details({
    super.key,
    required this.MY_ontap1,
    required this.MY_ontap2,
    this.MY_ontap3,
    required this.image_1,
    required this.title,
    this.image_2 = '',
    this.image_3 = '',
    this.D_2 = '',
    this.D_1 = '',
  });

  @override
  State<tafseel_details> createState() => _tafseel_detailsState();
}

class _tafseel_detailsState extends State<tafseel_details> {
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
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 35, 35, 35).withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ], borderRadius: BorderRadius.circular(12), color: Colors_and_Dimentions.main_continer_color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  FP_textSTyle(
                    text_content: widget.title,
                  ),
                  const SizedBox(
                    height: Colors_and_Dimentions.Hight_70,
                  ),
                  InkWell(
                    onTap: widget.MY_ontap1,
                    child: Column(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Colors_and_Dimentions.Circular_border_12)),
                          height: Colors_and_Dimentions.pic_H,
                          width: Colors_and_Dimentions.pic_W,
                          child: Image.network(
                            widget.image_1,
                            fit: BoxFit.cover,
                          ),
                        ),
                        FP_textSTyle(
                          text_content: widget.D_1,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: Colors_and_Dimentions.Hight_70,
                  ),
                  InkWell(
                    onTap: widget.MY_ontap2,
                    child: Column(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Colors_and_Dimentions.Circular_border_12)),
                          height: Colors_and_Dimentions.pic_H,
                          width: Colors_and_Dimentions.pic_W,
                          child: Image.network(
                            widget.image_2,
                            fit: BoxFit.cover,
                          ),
                        ),
                        FP_textSTyle(
                          text_content: widget.D_2,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: Colors_and_Dimentions.Hight_70,
                  ),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
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
                                                builder: (context) =>
                                                    const HomePage(), // pass the document ID to the next page
                                              ),
                                            );

                                            FirebaseFirestore.instance
                                                .collection('order_details')
                                                .doc('$_uid')
                                                .delete();
                                          },
                                          child: Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                color: Colors_and_Dimentions.containercolor,
                                              ),
                                              child: FP_textSTyle(
                                                text_content: '??????',
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
                                              child: FP_textSTyle(
                                                text_content: '????',
                                                text_color: Colors_and_Dimentions.fontcolor,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                  title: const Text(
                                    '???? ???????? ??????????????  ',
                                    style: TextStyle(color: Colors_and_Dimentions.fontcolor2),
                                  ),
                                  backgroundColor: Colors_and_Dimentions.main_continer_color,
                                );
                              },
                            );
                          },
                          child: Icon(
                            Icons.cancel_outlined,
                            size: 20,
                          ))
                    ],
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
