import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/pages/Orders_Pages.dart';
import 'package:flutter/material.dart';

class pay_page extends StatelessWidget {
  const pay_page({super.key});
  @override
  Widget build(BuildContext context) {
    const usr = '';
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(),
        child: ListView(padding: const EdgeInsets.all(25), children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Image.network(
                'https://www.bbva.es/en/content/dam/public-web/bbvaes/images/personas/productos/02_tarjetas/cards/card-aqua-mas.jpg.img.1600.1655986015861.jpg'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 151, 151, 151)),
              ),
              Container(
                alignment: Alignment.center,
                child: TextButton(
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
                                            const orders_page(), // pass the document ID to the next page
                                      ),
                                    );

                                    CollectionReference cartRef = FirebaseFirestore.instance.collection('cart_content');

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
                            ' هل تريد الانتقال الى السلة ',
                            style: TextStyle(color: Colors_and_Dimentions.fontcolor2),
                          ),
                          backgroundColor: Colors_and_Dimentions.main_continer_color,
                        );
                      },
                    );
                    CollectionReference cartRef = FirebaseFirestore.instance.collection('cart_content');
                    CollectionReference ordersRef = FirebaseFirestore.instance.collection('_orders');

                    cartRef.get().then((querySnapshot) {
                      for (var doc in querySnapshot.docs) {
                        ordersRef.doc(doc.id).set(doc.data());
                      }
                    });
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 47, 87, 95)),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(102, 91, 91, 91),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    child: const Text(
                      'pay',
                      style:
                          TextStyle(color: Color.fromARGB(255, 0, 76, 91), fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
