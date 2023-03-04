import 'package:final_project/combonents/Constants/Qumash_Details_modols.dart';
import 'package:final_project/combonents/Constants/Tailor_Details_modols.dart';
import 'package:final_project/combonents/Qumash_Card.dart';
import 'package:final_project/combonents/Tailor_Card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          height: 900,
          child: ListView(
            children: [
              for (var i in Tailor_Detail.List_of_tailors)
                Tailor_Card(
                  item: i,
                ),
              for (var qumash in Qumash_Detail.List_of_Qumashs) Qumash_Card(qumash: qumash)
            ],
          ),
        ),
      ),
    );
  }
}
