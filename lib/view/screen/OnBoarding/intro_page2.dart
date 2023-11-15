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
            child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    offset: Offset(0, 4),
                    color: Color.fromRGBO(0, 0, 0, 0.35))
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
                'assets/image/OnBoarding2.png',
                width: 246,
                height: 225,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 17, left: 22),
            child: Text(
              'Dukungan Konseling Dokter',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700, fontSize: 33, height: 1.2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 13, left: 22, right: 25),
            child: Text(
              'Anda akan merasakan kehadiran dokter-dokter berpengalaman yang siap membantu. Konseling ini memberikan dukungan berkelanjutan dan solusi yang sesuai dengan kebutuhan Anda.',
              style: GoogleFonts.montserrat(fontSize: 14, height: 1.4),
            ),
          ),
        ]);
  }
}
