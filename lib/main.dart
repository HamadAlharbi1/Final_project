import 'package:final_project/App.dart';
import 'package:final_project/firebase_options.dart';
import 'package:final_project/pages/onbording_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    builder: (context, child) {
      return child!;
    },
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: buildFirstWidget(),
    ),
  ));
}

// class DarkThemePreference {
//   static const THEME_STATUS = "THEMESTATUS";

//   setDarkTheme(bool value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool(THEME_STATUS, value);
//   }

//   Future<bool> getTheme() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(THEME_STATUS) ?? false;
//   }
// }

Widget buildFirstWidget() {
  final User? firebaseUser = FirebaseAuth.instance.currentUser;

  if (firebaseUser == null) {
    return const LoginPage();
  } else {
    return const MyApp();
  }
}
