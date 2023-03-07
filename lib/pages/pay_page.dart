import 'package:flutter/material.dart';

import '../combonents/Drawer/DrawerWidget.dart';

class pay_page extends StatelessWidget {
  const pay_page({super.key});
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
      body: Container(

        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 108, 184, 247),
              Color.fromARGB(255, 235, 166, 6),
            ],

        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(),
        child: ListView(padding: const EdgeInsets.all(25), children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Image.network(
                'https://www.bbva.es/en/content/dam/public-web/bbvaes/images/personas/productos/02_tarjetas/cards/card-aqua-mas.jpg.img.1600.1655986015861.jpg'),

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
              color: Colors.white,
              child: const CustomTextField(hint: 'XXXX-XXXX-XXXX-XXXX'),
            ),
            const Text(
              'Cardholder Name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
=======
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
            ),
            const SizedBox(height: 8.0),
            Container(
              color: Colors.white,
              child: const CustomTextField(hint: 'Mohammad'),
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
              color: Colors.white,
              child: const CustomTextField(hint: 'MM/DD/YYYY'),
            ),
          ],
        ),
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

// class VisaCard extends StatelessWidget {
//   const VisaCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// import 'package:flutter/material.dart';

// class VisaCard extends StatelessWidget {
//   const VisaCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16.0),
//         gradient: LinearGradient(
//           colors: [
//             Colors.blue.shade800,
//             Colors.blue.shade500,
//           ],
//         ),
//       ),
//       child: ListView(
//         //crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Card Number',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8.0),
//           const TextField(
//             decoration: InputDecoration(
//               hintText: 'XXXX-XXXX-XXXX-XXXX',
//               hintStyle: TextStyle(color: Colors.white),
//               border: InputBorder.none,
//             ),
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20.0,
//               letterSpacing: 4.0,
//               fontFamily: 'RobotoMono',
//             ),
//           ),
//           const SizedBox(height: 16.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     'Cardholder Name',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 12.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8.0),
//                   Text(
//                     'Full Name',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16.0,
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     'Expires',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 12.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8.0),
//                   Text(
//                     'MM/YY',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16.0,
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     'Security Code',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 12.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8.0),
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: 'XXX',
//                       hintStyle: TextStyle(color: Colors.white),
//                       border: InputBorder.none,
//                     ),
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16.0,
//                       fontFamily: 'RobotoMono',
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }














//  showDialog(
//                         context: context,
//                         builder: (context) {
//                           return AlertDialog(
//                             actions: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   InkWell(
//                                     onTap: () {
//                                       Navigator.pushReplacement(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) =>
//                                               const after_TD(), // pass the document ID to the next page
//                                         ),
//                                       );

//                                       CollectionReference cartRef =
//                                           FirebaseFirestore.instance.collection('cart_content');

//                                       cartRef.get().then((querySnapshot) {
//                                         for (var doc in querySnapshot.docs) {
//                                           doc.reference.delete();
//                                         }
//                                       });
//                                     },
//                                     child: Container(
//                                         alignment: Alignment.center,
//                                         padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(12),
//                                           color: Colors_and_Dimentions.containercolor,
//                                         ),
//                                         child: const FP_textSTyle(
//                                           text_content: 'نعم',
//                                           text_color: Colors_and_Dimentions.fontcolor,
//                                         )),
//                                   ),
                               
                               
//                                   InkWell(
//                                     onTap: () {
//                                       Navigator.pop(context);
//                                     },
//                                     child: Container(
//                                         alignment: Alignment.center,
//                                         padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(12),
//                                           color: Colors_and_Dimentions.containercolor,
//                                         ),
//                                         child: const FP_textSTyle(
//                                           text_content: 'لا',
//                                           text_color: Colors_and_Dimentions.fontcolor,
//                                         )),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                             title: const Text(
//                               ' هل تريد الانتقال الى السلة ',
//                               style: TextStyle(color: Colors_and_Dimentions.fontcolor2),
//                             ),
//                             backgroundColor: Colors_and_Dimentions.main_continer_color,
//                           );
//                         },
//                       );
//                       CollectionReference cartRef = FirebaseFirestore.instance.collection('cart_content');
//                       CollectionReference ordersRef = FirebaseFirestore.instance.collection('_orders');

//                       cartRef.get().then((querySnapshot) {
//                         for (var doc in querySnapshot.docs) {
//                           ordersRef.doc(doc.id).set(doc.data());
//                         }
//                       });