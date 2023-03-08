import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/pages/Cart_Page.dart';
import 'package:final_project/pages/Home_Page.dart';
import 'package:final_project/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../combonents/text_field1.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emaillogin = TextEditingController();
  final passlogin = TextEditingController();
  String? _uid;
  String? user_email;
  final bool _isFocused = false;
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    emaillogin.dispose();
    passlogin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: Image.network(
                    'https://cdn.discordapp.com/attachments/1081328393364189276/1081621027513188473/image_13_BIG.png',
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'البريد الإلكتروني',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors_and_Dimentions.fontcolor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              TextField1(
                prefix_icon: Icon(Icons.email_sharp),
                prefix_icon_color: Colors_and_Dimentions.fontcolor,
                Enable: true,
                secure_text: false,
                controll: emaillogin,
                isFocused: true,
                hint1: 'البريد الإلكتروني',
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'كلمة المرور',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors_and_Dimentions.fontcolor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            TextField1(
              prefix_icon: Icon(Icons.lock),
              prefix_icon_color: Colors_and_Dimentions.fontcolor,
              Enable: true,
              secure_text: true,
              controll: passlogin,
              isFocused: true,
              hint1: 'كلمة المرور',
            ),
            const Spacer(
              flex: 6,
            ),
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors_and_Dimentions.fontcolor,
                    ),
                  )
                : InkWell(
                    onTap: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      try {
                        final email_ = emaillogin.text;
                        final password_ = passlogin.text;
                        final user =
                            await FirebaseAuth.instance.signInWithEmailAndPassword(email: email_, password: password_);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return const HomePage();
                        }));
                      } catch (e) {
                        print(e);
                      }
                      setState(() {
                        _isLoading = false;
                      });
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
                              colors: [Color(0xff796763), Color.fromARGB(255, 104, 85, 80)])),
                      child: const Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const RegisterPage();
                    },
                  ),
                );
              },
              child: const Center(
                child: Text(
                  'ليس لديك حساب؟ سجل من هنا',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff796763),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 21,
            )
          ],
        ),
      ),
    );
  }
}
