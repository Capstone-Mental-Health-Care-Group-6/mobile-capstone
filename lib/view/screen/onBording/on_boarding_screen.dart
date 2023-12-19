import 'package:empathi_care/utils/constant/pagecontroller.dart';
import 'package:empathi_care/view/screen/login_screen.dart';
import 'package:empathi_care/view/screen/onbording/intro_page1.dart';
import 'package:empathi_care/view/screen/onbording/intro_page2.dart';
import 'package:empathi_care/view/screen/onbording/intro_page3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) {
              if (value == 2) {
                onLastPage = true;
              } else {
                onLastPage = false;
              }
            },
            children: const [IntroPage1(), IntroPage2(), IntroPage3()],
          ),
          Container(
            alignment: const Alignment(0, 0.78),
            child: SmoothPageIndicator(
              effect: const WormEffect(
                  dotColor: Color(0xffD9D9D9),
                  activeDotColor: Color(0xff000000)),
              controller: pageController,
              count: 3,
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.96),
            child: Padding(
              padding: const EdgeInsets.only(left: 22, right: 21),
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: Color.fromRGBO(0, 0, 0, 0.20),
                      offset: Offset(0, 4))
                ]),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(370, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: const Color(0XFF0085FF),
                        foregroundColor: Colors.white),
                    onPressed: () {
                      onLastPage
                          ? Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (_) => const LoginScreen()))
                          : pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                    },
                    child: Text(
                      'Berikutnya',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700, fontSize: 14),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
