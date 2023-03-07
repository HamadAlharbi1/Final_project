import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/Qumash_Details_modols.dart';
import 'package:final_project/combonents/Constants/Tailor_Details_modols.dart';
<<<<<<< HEAD
import 'package:final_project/pages/Home_Page.dart';
=======
import 'package:final_project/pages/profile_page.dart';
>>>>>>> 9a93647a609bd275f659d197d34cf3e074df283d
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    for (final i in Tailor_Detail.List_of_tailors) {
      final showroomCollection = FirebaseFirestore.instance.collection('List_of_Tailors');
      final resDoc = showroomCollection.doc(i.id);
      resDoc.set(i.toMap());
    }
    for (final i in Qumash_Detail.List_of_Qumashs) {
      final showroomCollection = FirebaseFirestore.instance.collection('List_of_Qumashs');
      final resDoc = showroomCollection.doc(i.id);
      resDoc.set(i.toMap());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
<<<<<<< HEAD
      home: HomePage(),
=======
      home: ProfilePage(),
>>>>>>> 9a93647a609bd275f659d197d34cf3e074df283d
      debugShowCheckedModeBanner: false,
    );
  }
}
