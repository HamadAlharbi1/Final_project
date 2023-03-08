import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/pages/after_pay_page.dart';
import 'package:flutter/material.dart';

import '../combonents/Drawer/DrawerWidget.dart';

class pay_page extends StatefulWidget {
  const pay_page({super.key});

  @override
  State<pay_page> createState() => _pay_pageState();
}

class _pay_pageState extends State<pay_page> {
  TextEditingController dateinput = TextEditingController(text: '0/00');
  DateTime? dateUserInput;
  Timestamp? timeStampPick;
  //text editing controller for text field
  pickDate() async {
    dateUserInput = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(
          const Duration(days: 0),
        ),
        lastDate: DateTime(2100));
    if (dateUserInput != null) {
      setState(() {
        timeStampPick = Timestamp.fromMicrosecondsSinceEpoch(dateUserInput!.microsecondsSinceEpoch);
        dateinput.text = '${dateUserInput!.year} - ${dateUserInput!.month} - ${dateUserInput!.day}';
      });
    }
  }

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const usr = '';
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors_and_Dimentions.icon_color,
        centerTitle: true,
        title: Image.network(
          'https://cdn.discordapp.com/attachments/1081328393364189276/1082219855991803984/image_146.png',
          fit: BoxFit.contain,
        ),
      ),
      //drawer
      endDrawer: const DrawerWidget(),
      body: Padding(
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
                child: InkWell(
                  onTap: () {
                    pickDate();
                  },
                  child: CustomTextField(
                    hint: 'MM/DD/yyyy',
                    isenable: false,
                    controller_: dateinput,
                  ),
                ),
              ),

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
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.isenable,
    required this.hint,
    this.controller_,
    super.key,
  });
  final bool? isenable;
  final String hint;
  final TextEditingController? controller_;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.isenable,
      controller: widget.controller_,
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
