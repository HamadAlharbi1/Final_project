import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    return Drawer(
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
                colors: [Colors.red, Colors.pink],
              ),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image.png'),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  trailing: const Icon(Icons.edit),
                  title: Container(
                    alignment: Alignment.centerRight,
                    child: const Text('Item 3'),
                  ),
                  onTap: () {
                    // Handle item 3 tap
                  },
                ),
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
          const SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }
}
