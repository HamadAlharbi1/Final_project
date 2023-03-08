import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/pages/Orders_Pages.dart';
import 'package:final_project/pages/after_pay_page.dart';
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
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors_and_Dimentions.main_continer_color),
              ),
              onPressed: () {
                CollectionReference cartRef2 = FirebaseFirestore.instance.collection('cart_content');
                CollectionReference ordersRef = FirebaseFirestore.instance.collection('_orders');

                cartRef2.get().then((querySnapshot) {
                  querySnapshot.docs.forEach((doc) {
                    ordersRef.doc(doc.id).set(doc.data());
                  });
                });
                CollectionReference cartRef = FirebaseFirestore.instance.collection('cart_content');

                cartRef.get().then((querySnapshot) {
                  querySnapshot.docs.forEach((doc) {
                    doc.reference.delete();
                  });
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
