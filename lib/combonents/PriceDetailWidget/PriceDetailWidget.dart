import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/pages/Home_Page.dart';
import 'package:final_project/pages/pay_page.dart';
import 'package:flutter/material.dart';

class PriceDetailWidget extends StatefulWidget {
  double vat;
  double t;
  int s;
  PriceDetailWidget({super.key, required this.s, required this.vat, required this.t});

  @override
  State<PriceDetailWidget> createState() => _PriceDetailWidgetState();
}

class _PriceDetailWidgetState extends State<PriceDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.s}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'أجمالي السلة',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ' ريال 0 ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'تكلفة التفاصيل الإضافية ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.vat}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'تكلفة القيمة المضافة 15%',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.t}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            ' إجمالي المستحق',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
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
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomePage(), // pass the document ID to the next page
                                                ),
                                              );

                                              CollectionReference cartRef =
                                                  FirebaseFirestore.instance.collection('cart_content');

                                              cartRef.get().then((querySnapshot) {
                                                for (var doc in querySnapshot.docs) {
                                                  doc.reference.delete();
                                                }
                                              });
                                            },
                                            child: Container(
                                                alignment: Alignment.center,
                                                padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12),
                                                  color: Colors_and_Dimentions.containercolor,
                                                ),
                                                child: const FP_textSTyle(
                                                  text_content: 'نعم',
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
                                                child: const FP_textSTyle(
                                                  text_content: 'لا',
                                                  text_color: Colors_and_Dimentions.fontcolor,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                    title: const Text(
                                      'هل تريد حذف محتويات السلة   ',
                                      style: TextStyle(color: Colors_and_Dimentions.fontcolor2),
                                    ),
                                    backgroundColor: Colors_and_Dimentions.main_continer_color,
                                  );
                                },
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors_and_Dimentions.icon_color),
                            ),
                            child: const Text(
                              ' إلغاء الشراء',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const pay_page(), // pass the document ID to the next page
                                ),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors_and_Dimentions.BK_color),
                            ),
                            child: const Text(
                              '  إتمام الشراء ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors_and_Dimentions.font_color,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          // const Text(
                          //   '  ',
                          //   style: TextStyle(
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 18,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(24.0),
              //   child: Container(
              //     color: Colors.amber,
              //     width: 150,
              //     height: 200,
              //     child: const Text('data'),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
