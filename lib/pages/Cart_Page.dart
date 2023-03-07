import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/Tafseel_Detail.dart';
import 'package:flutter/material.dart';

import '../combonents/Constants/Qumash_Details_modols.dart';
import '../combonents/Constants/Tailor_Details_modols.dart';
import '../combonents/Drawer/DrawerWidget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  StreamSubscription? listener_of_T_Details;

  List<Tafseel_Details> T_Details = [];

  @override
  void initState() {
    listener_of_T_Details?.cancel();

    super.initState();

    listenToT_Details();
  }

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

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          height: 900,
          child: ListView(
            children: [
              for (var c in T_Details) CardCartWidget(),
              PriceDetailWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class PriceDetailWidget extends StatelessWidget {
  const PriceDetailWidget({super.key});

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
                        children: const [
                          Text(
                            '',
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
                        children: const [
                          Text(
                            ' 0 ريال',
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
                        children: const [
                          Text(
                            ' ',
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
                        children: const [
                          Text(
                            ' ',
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
                            onPressed: () {},
                            child: const Text(
                              '  إتمام الشراء ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const Text(
                            '  ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
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

class CardCartWidget extends StatefulWidget {
  const CardCartWidget({
    super.key,
  });

  @override
  State<CardCartWidget> createState() => _CardCartWidgetState();
}

class _CardCartWidgetState extends State<CardCartWidget> {
  bool _isChecked = false;
  bool _iChecked = true;
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'أخذ المقاس',
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.amber,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    // leading: const Icon(Icons.clear),
                    title: const Text('قياس خياطتي'),
                    onTap: () {
                      // Perform some action when Option 2 is selected
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.amber[800],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    // leading: const Icon(Icons.clear),
                    title: const Text('قياس خياطتي'),
                    onTap: () {
                      // Perform some action when Option 2 is selected
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

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
                  children: const [
                    Text(
                      'قماش كوري',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      ' قماش طبيعي 100',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('السعر 250')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  color: Colors.amber,
                  width: 150,
                  height: 200,
                  child: const Text('data'),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.amber,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CheckboxListTile(
                          title: const Text('تفصيل الثوب'),
                          value: _iChecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _iChecked = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.amber,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CheckboxListTile(
                          title: const Text('تفصيل الثوب'),
                          value: _isChecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _isChecked = newValue!;
                              if (_isChecked) {
                                _showBottomSheet(context);
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
