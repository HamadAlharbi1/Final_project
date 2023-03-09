import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/App.dart';
import 'package:final_project/pages/Orders_Pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages/login_page.dart';
import '../../pages/maqasaty.dart';
import '../Constants/constants.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _uid;
  String? user_email;
  String? user_name;
  String? user_phoneNumber;

  @override
  void initState() {
    getData();

    super.initState();
  }

  getData() async {
    User? user = _auth.currentUser;
    String uid = user!.uid;
    try {
      final DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('UserData').doc(uid).get();
      if (userDoc == null) {
        return;
      } else {
        setState(() {
          user_name = userDoc.get('name');
          user_email = userDoc.get('email');
          user_phoneNumber = userDoc.get('phonenumber');
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user_name == null ? '' : user_name!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            accountEmail: Text(user_email == null ? '' : '$user_email',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors_and_Dimentions.icon_color, Colors_and_Dimentions.container_color],
              ),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/271deea8-e28c-41a3-aaf5-2913f5f48be6/de7834s-6515bd40-8b2c-4dc6-a843-5ac1a95a8b55.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzI3MWRlZWE4LWUyOGMtNDFhMy1hYWY1LTI5MTNmNWY0OGJlNlwvZGU3ODM0cy02NTE1YmQ0MC04YjJjLTRkYzYtYTg0My01YWMxYTk1YThiNTUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.BopkDn1ptIwbmcKHdAOlYHyAOOACXW0Zfgbs0-6BY-E'),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  trailing: const Icon(Icons.edit),
                  title: Container(
                    alignment: Alignment.centerRight,
                    child: const Text('مقاساتي'),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Maqasaty(),
                      ),
                    );
                    // Handle item 3 tap
                  },
                ),
                ListTile(
                  trailing: const Icon(Icons.edit),
                  title: Container(
                    alignment: Alignment.centerRight,
                    child: const Text('طلباتي'),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const orders_page(),
                      ),
                    );
                    // Handle item 3 tap
                  },
                ),
                ListTile(
                  trailing: const Icon(Icons.edit),
                  title: Container(
                    alignment: Alignment.centerRight,
                    child: const Text('Mood'),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Switch.adaptive(
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      final provider = Provider.of<ThemeProvider>(context, listen: false);
                      provider.toggleTheme(value);
                    },
                  ),
                )
                // Add more items as needed
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 36),
            alignment: Alignment.center,
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34),
                gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color.fromARGB(255, 194, 0, 32), Color.fromARGB(255, 243, 56, 56)])),
            child: InkWell(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text(
                'تسجيل الخروج',
                style: TextStyle(
                  fontFamily: 'JosefinSans',
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }
}

class ChangeThemeButtonWidget extends StatefulWidget {
  const ChangeThemeButtonWidget({super.key});

  @override
  State<ChangeThemeButtonWidget> createState() => _ChangeThemeButtonWidgetState();
}

class _ChangeThemeButtonWidgetState extends State<ChangeThemeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}
