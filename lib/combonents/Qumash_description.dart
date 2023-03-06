import 'package:final_project/combonents/Constants/constants.dart';
import 'package:flutter/material.dart';

class Qumash_Description extends StatelessWidget {
  final String qumash_Description;
  const Qumash_Description({super.key, required this.qumash_Description});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(qumash_Description,
          style: const TextStyle(
            color: Colors_and_Dimentions.fontcolor2,
            fontSize: Colors_and_Dimentions.fontsize_12,
          ),
          textAlign: TextAlign.right,
          overflow: TextOverflow.clip),
    );
  }
}
