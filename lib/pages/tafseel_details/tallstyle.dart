import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/combonents/tafseel_details.dart';
import 'package:flutter/material.dart';

class Tallstyle extends StatelessWidget {
  const Tallstyle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_and_Dimentions.BK_color,
      body: tafseel_details(
        MY_ontap: () {
          print('onTap function called');
        },
        title: 'اختر  الطول',
        image_1: 'https://media.discordapp.net/attachments/1081328393364189276/1081637367120666725/IMG_2808.png',
        image_2: 'https://media.discordapp.net/attachments/1081328393364189276/1081637367120666725/IMG_2808.png',
        image_3: 'https://media.discordapp.net/attachments/1081328393364189276/1081637367120666725/IMG_2808.png',
      ),
    );
  }
}
