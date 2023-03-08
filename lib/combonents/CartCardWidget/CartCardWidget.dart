import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/Tafseel_Detail.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/combonents/img_container.dart';
import 'package:final_project/pages/maqasaty.dart';
import 'package:final_project/pages/qyas_khiadhti.dart';
import 'package:flutter/material.dart';

class CardCartWidget extends StatefulWidget {
  final Tafseel_Details c;
  const CardCartWidget({super.key, required this.c});

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
              const SizedBox(
                height: 32,
              ),
              const FP_textSTyle(
                font_size: 20,
                font_weight: FontWeight.bold,
                text_content: 'أخذ المقاس',
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors_and_Dimentions.main_continer_color,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    // leading: const Icon(Icons.clear),
                    title: const Center(
                        child: FP_textSTyle(font_weight: FontWeight.bold, text_content: 'استخدام قياس سابق')),
                    onTap: () {
                      // Perform some action when Option 2 is selected
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Maqasaty(), // pass the document ID to the next page
                        ),
                      );
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
                  color: Colors_and_Dimentions.main_continer_color,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    // leading: const Icon(Icons.clear),
                    title: const Center(
                        child: FP_textSTyle(font_weight: FontWeight.bold, text_content: 'اطلب خياط لاخذ مقاساتك ')),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const qyas_khiadhti(), // pass the document ID to the next page
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 64,
              )
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.c.qumash,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 290,
                        child: Text(
                          widget.c.qumash_D,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      FP_textSTyle(
                        text_content: '${widget.c.qumash_Price}',
                        font_size: 20,
                        font_weight: FontWeight.bold,
                      )
                    ],
                  ),
                ),
                IMg_container(Img_URL: widget.c.qumash_IMG),
              ],
            ),
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
                        color: Colors_and_Dimentions.main_continer_color,
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
                        color: Colors_and_Dimentions.main_continer_color,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CheckboxListTile(
                          title: const Text('اختيار المقاس'),
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
