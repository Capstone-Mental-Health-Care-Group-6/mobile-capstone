import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeLine3 extends StatelessWidget {
  const TimeLine3({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: 59,
          height: 59,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                width: 2,
                color: const Color(0xff2B99FF),
              )),
          child: Text(
            '1',
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: const Color(0xff2B99FF)),
          ),
        ),
        Container(
          height: 2.3,
          width: 41,
          color: const Color(0xff2B99FF),
        ),
        Container(
          alignment: Alignment.center,
          width: 59,
          height: 59,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                width: 2,
                color: const Color(0xff2B99FF),
              )),
          child: Text(
            '2',
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: const Color(0xff2B99FF)),
          ),
        ),
        Container(
          height: 2.3,
          width: 41,
          color: const Color(0xff2B99FF),
        ),
        Container(
          alignment: Alignment.center,
          width: 59,
          height: 59,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color(0xff2B99FF),
          ),
          child: Text(
            '3',
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w600, fontSize: 24, color: Colors.white),
          ),
        ),
        Container(
          height: 2.3,
          width: 41,
          color: const Color(0xff2B99FF),
        ),
        Container(
          alignment: Alignment.center,
          width: 59,
          height: 59,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                width: 2,
                color: const Color(0xff2B99FF),
              )),
          child: Text(
            '4',
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: const Color(0xff2B99FF)),
          ),
        ),
      ],
    );
  }
}
