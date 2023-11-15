import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage3 extends StatefulWidget {
  const IntroPage3({super.key});

  @override
  State<IntroPage3> createState() => _IntroPage3State();
}

class _IntroPage3State extends State<IntroPage3> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 132, left: 26),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 55, right: 59, top: 130),
              child: Image.asset(
                'assets/image/OnBoarding3.png',
                width: 246,
                height: 225,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 17, left: 22, right: 33),
            child: Text(
              'Chat AI untuk Dukungan 24/7',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700, fontSize: 33, height: 1.2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 13, left: 22, right: 27),
            child: Text(
              'Di tengah kesibukan sehari-hari, layanan chat AI kami akan selalu ada untuk memberikan jawaban cepat atas pertanyaan umum terkait kesehatan mental. .',
              style: GoogleFonts.montserrat(fontSize: 14, height: 1.4),
            ),
          ),
        ]);
  }
}
