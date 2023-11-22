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
            child: OutlinedButton(
              onPressed: () {
                pageController.jumpToPage(2);
              },
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF0085FF), width: 1),
                  padding: EdgeInsets.zero,
                  alignment: Alignment.center,
                  fixedSize: const Size(100, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  foregroundColor: const Color(0XFF0085FF)),
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
          Padding(
            padding: EdgeInsets.only(
                left: 22,
                right: 59,
                top: MediaQuery.of(context).size.height / 25),
            child: Image.asset(
              'assets/image/OnBoarding1.png',
              width: 292,
              height: 308,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 33, left: 22, right: 29),
            child: Text(
              'Mulailah Perjalanan Anda!',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700, fontSize: 33, height: 1.2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 19, left: 22, right: 25),
            child: Text(
              'Di aplikasi kesehatan mental kami, Anda akan menemukan berbagai fitur dan dukungan yang diperlukan untuk merawat pikiran dan jiwa Anda. Mari menjelajahi jalan kebahagiaan dan kesejahteraan yang lebih baik.',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(fontSize: 14, height: 1.4),
            ),
          ),
        ]);
  }
}
