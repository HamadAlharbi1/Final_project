import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../combonents/text_field1.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final username = TextEditingController();
  final emailregister = TextEditingController();
  final passregister = TextEditingController();
  final phonenumber = TextEditingController();

  @override
  void dispose() {
    emailregister.dispose();
    username.dispose();
    phonenumber.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: Image.network(
                    'https://cdn.discordapp.com/attachments/1081328393364189276/1081621027513188473/image_13_BIG.png',
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12,
                ),
                const SizedBox(
                  height: 28,
                ),
                TextField1(
                  Enable: true,
                  secure_text: false,
                  controll: username,
                  isFocused: true,
                  hint1: 'اسم المستخدم',
                ),
                const SizedBox(
                  height: 28,
                ),
                TextField1(
                  Enable: true,
                  secure_text: false,
                  controll: emailregister,
                  isFocused: true,
                  hint1: 'البريد الإلكتروني',
                ),
                const SizedBox(
                  height: 28,
                ),
                TextField1(
                  Enable: true,
                  secure_text: false,
                  controll: phonenumber,
                  isFocused: false,
                  hint1: 'رقم الجوال',
                ),
                const SizedBox(
                  height: 28,
                ),
                TextField1(
                  Enable: true,
                  secure_text: true,
                  controll: passregister,
                  isFocused: true,
                  hint1: 'الرمز السري',
                ),
                const SizedBox(
                  height: 28,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                try {
                  final username1 = username.text;
                  final phonenumber1 = phonenumber.text;
                  final Email = emailregister.text;
                  final Pass = passregister.text;

                  /// there is an issue with login which need to be checked
                  final newuser = FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: Email, password: Pass)
                      .then((value) {
                    FirebaseFirestore.instance.collection('UserData')
                      ..doc(value.user!.uid).set({
                        'id': value.user!.uid,
                        'email': value.user!.email,
                        'name': username1,
                        'phonenumber': phonenumber1,
                      });
                  });
                  if (newuser != null) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                  } else {
                    print('false input');
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 65,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(34),
                    gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xff796763), Color(0xff796763)])),
                child: const Text(
                  'تسجيل جديد',
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
              height: 12,
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: const Center(
                child: Text(
                  'لديك حساب بالفعل',
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff796763),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'JosefinSans'),
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            )
          ],
        ),
      ),
    );
  }
}
