import 'package:empathi_care/utils/constant/pagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage1 extends StatefulWidget {
  const IntroPage1({super.key});

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 84, left: 26),
            child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: Color.fromRGBO(0, 0, 0, 0.35),
                    offset: Offset(0, 4))
              ]),
              child: ElevatedButton(
                onPressed: () {
                  pageController.jumpToPage(2);
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.center,
                    fixedSize: const Size(75, 36),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: const Color(0XFF0085FF),
                    foregroundColor: Colors.white),
                child: const Padding(
                  padding:
                      EdgeInsets.only(left: 9.5, right: 9.5, top: 8, bottom: 8),
                  child: Text(
                    'Lewati',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 55, right: 59, top: 130),
              child: Image.asset(
                'assets/image/OnBoarding1.png',
                width: 246,
                height: 225,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 17, left: 22),
            child: Text(
              'Mulailah Perjalanan Anda!',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700, fontSize: 33, height: 1.2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 13, left: 22, right: 25),
            child: Text(
              'Di aplikasi kesehatan mental kami, Anda akan menemukan berbagai fitur dan dukungan yang diperlukan untuk merawat pikiran dan jiwa Anda. Mari menjelajahi jalan kebahagiaan dan kesejahteraan yang lebih baik.',
              style: GoogleFonts.montserrat(fontSize: 14, height: 1.4),
            ),
          ),
        ]);
  }
}
