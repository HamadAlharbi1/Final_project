import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/combonents/Constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
    return Scaffold(
      backgroundColor: Color(0xffeaeaea),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25.0), bottomRight: Radius.circular(25.0))),
        elevation: 0,
        backgroundColor: Colors.black.withOpacity(0.1),
        centerTitle: true,
        title: const Text(
          'بيانات الحساب',
          style: TextStyle(
            shadows: [
              BoxShadow(offset: Offset(0, 5), color: Color.fromARGB(47, 151, 226, 247), spreadRadius: 1, blurRadius: 7)
            ],
            fontFamily: 'JosefinSans',
            color: Colors_and_Dimentions.font_color,
            fontSize: 26,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(24),
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 0.6, spreadRadius: 0.8)],
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  const CircleAvatar(
                    maxRadius: 55,
                    backgroundColor: Colors_and_Dimentions.fontcolor,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://t3.ftcdn.net/jpg/03/39/45/96/360_F_339459697_XAFacNQmwnvJRqe1Fe9VOptPWMUxlZP8.jpg'),
                      radius: 50,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    user_name == null ? '' : user_name!,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w400, color: Colors_and_Dimentions.font_color),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 4,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'بيانات التواصل ',
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold, color: Colors_and_Dimentions.font_color),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              user_email == null ? '' : '$user_email',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w300, color: Colors_and_Dimentions.font_color),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Text(
                              'البريد الإلكتروني',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600, color: Colors_and_Dimentions.font_color),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              user_phoneNumber == null ? '' : '$user_phoneNumber',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w300, color: Colors_and_Dimentions.font_color),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Text(
                              'رقم الجوال',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600, color: Colors_and_Dimentions.font_color),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            FirebaseAuth.instance.signOut();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return const LoginPage();
                            }));
                          });
                        },
                        child: Container(
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
                      ),
                      const SizedBox(
                        height: 32,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
