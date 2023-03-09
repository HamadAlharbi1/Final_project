import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/Qumash_Details_modols.dart';
import 'package:final_project/combonents/Constants/Tailor_Details_modols.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/pages/Home_Page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    getCurrentAppTheme();
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

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme = await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      themeMode: themeProvider.themeMode,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.lightTheme,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  bool get isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      primaryColor: Colors.black,
      colorScheme: const ColorScheme.dark(),
      iconTheme: const IconThemeData(color: Colors_and_Dimentions.icon_color));
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: Colors_and_Dimentions.container_color),
  );
}

class DarkThemePreference {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}


// class Styles {
//   static ThemeData themeData(bool isDarkTheme, BuildContext context) {
//     return ThemeData(
//       primaryColor: isDarkTheme ? Colors.black : Colors.white,

//       indicatorColor: isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),

//       hintColor: isDarkTheme ? const Color(0xff280C0B) : const Color(0xffEECED3),

//       highlightColor: isDarkTheme ? const Color(0xff372901) : const Color(0xffFCE192),
//       hoverColor: isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),

//       focusColor: isDarkTheme ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
//       disabledColor: Colors.grey,
//       //textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
//       cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,
//       canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
//       brightness: isDarkTheme ? Brightness.dark : Brightness.light,
//       buttonTheme: Theme.of(context)
//           .buttonTheme
//           .copyWith(colorScheme: isDarkTheme ? const ColorScheme.dark() : const ColorScheme.light()),
//       appBarTheme: const AppBarTheme(
//         elevation: 0.0,
//       ),
//       colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
//           .copyWith(background: isDarkTheme ? Colors.black : const Color(0xffF1F5FB)),
//     );
//   }
// }
