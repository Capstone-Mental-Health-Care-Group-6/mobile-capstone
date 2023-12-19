import 'package:empathi_care/utils/constant/pagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({super.key});

  @override
  State<IntroPage2> createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> {
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
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 55,
                  right: 59,
                  top: MediaQuery.of(context).size.height / 14),
              child: Image.asset(
                'assets/images/OnBoarding2.png',
                width: 298,
                height: 303.1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.9, left: 28, right: 34),
            child: Text(
              'Dukungan Konseling Dokter',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700,
                fontSize: 33,
                height: 1.2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 13, left: 22, right: 25),
            child: Text(
              'Anda akan merasakan kehadiran dokter-dokter berpengalaman yang siap membantu. Konseling ini memberikan dukungan berkelanjutan dan solusi yang sesuai dengan kebutuhan Anda.',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(fontSize: 14, height: 1.4),
            ),
          ),
        ]);
  }
}
