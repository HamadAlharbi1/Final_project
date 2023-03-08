import 'package:final_project/App.dart';
import 'package:final_project/firebase_options.dart';
import 'package:final_project/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Amiri'),
    debugShowCheckedModeBanner: false,
    home: buildFirstWidget(),
  ));
}

Widget buildFirstWidget() {
  final User? firebaseUser = FirebaseAuth.instance.currentUser;

  if (firebaseUser == null) {
    return const LoginPage();
  } else {
    return const MyApp();
  }
}
