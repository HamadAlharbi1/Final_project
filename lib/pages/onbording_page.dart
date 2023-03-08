import 'package:final_project/combonents/Constants/constants.dart';
import 'package:final_project/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controler = PageController();

  @override
  void dispose() {
    controler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controler,
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: 400,
                    width: 400,
                    child: Image.network(
                      'https://cdn.discordapp.com/attachments/1081328393364189276/1083115493990338560/Group_2962.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'فصل من بيتكك وافتك من الزحمة',
                    style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors_and_Dimentions.fontcolor),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: 400,
                    width: 400,
                    child: Image.network(
                      'https://cdn.discordapp.com/attachments/1081328393364189276/1083124600415715348/Group_2981.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'تواص اسرع مع اي خياط',
                    style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors_and_Dimentions.fontcolor),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.network(
                      'https://cdn.discordapp.com/attachments/1081328393364189276/1081621027513188473/image_13_BIG.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        'فصل اسرع فصل اروع',
                        style: TextStyle(
                            fontFamily: 'Amiri',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors_and_Dimentions.fontcolor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors_and_Dimentions.fontcolor, borderRadius: BorderRadius.circular(12)),
                      child: const Padding(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          children: [
                            Text(
                              'فصل ثوبك مع فصلي',
                              style: TextStyle(
                                  fontFamily: 'Amiri', fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              child: const Text(
                'السابق',
                style: TextStyle(
                  fontFamily: 'Amiri',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors_and_Dimentions.fontcolor,
                ),
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controler,
                count: 3,
                effect: const WormEffect(
                    spacing: 16,
                    dotColor: Color.fromARGB(255, 121, 121, 121),
                    activeDotColor: Colors_and_Dimentions.font_color),
                onDotClicked: (index) => controler.animateToPage(index,
                    duration: const Duration(milliseconds: 500), curve: Curves.easeInOut),
              ),
            ),
            TextButton(
              child: const Text(
                'التالي',
                style: TextStyle(
                    color: Colors_and_Dimentions.fontcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Amiri'),
              ),
              onPressed: () {
                controler.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
              },
            ),
          ],
        ),
      ),
    );
  }
}
