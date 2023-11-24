import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeLine1 extends StatelessWidget {
  const TimeLine1({super.key, required this.index});
  final int index;
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
                color:
                    (index == 1) ? const Color(0xff2B99FF) : Colors.transparent,
                border: (index == 1)
                    ? null
                    : Border.all(
                        width: 2,
                        color: const Color(0xff2B99FF),
                      )),
            child: (index == 1)
                ? Text(
                    '1',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color:
                          (index == 1) ? Colors.white : const Color(0xff2B99FF),
                    ),
                  )
                : const Icon(
                    Icons.check_rounded,
                    color: Color(0xff2B99FF),
                  )),
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
                color:
                    (index == 2) ? const Color(0xff2B99FF) : Colors.transparent,
                border: (index == 2)
                    ? null
                    : Border.all(color: const Color(0xff2B99FF), width: 2)),
            child: (index == 1 || index == 2)
                ? Text(
                    '2',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: (index == 2)
                            ? Colors.white
                            : const Color(0xff2B99FF)),
                  )
                : const Icon(
                    Icons.check_rounded,
                    color: Color(0xff2B99FF),
                  )),
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
                color:
                    (index == 3) ? const Color(0xff2B99FF) : Colors.transparent,
                border: (index == 3)
                    ? null
                    : Border.all(
                        width: 2,
                        color: const Color(0xff2B99FF),
                      )),
            child: (index != 4)
                ? Text(
                    '3',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: (index == 3)
                            ? Colors.white
                            : const Color(0xff2B99FF)),
                  )
                : const Icon(
                    Icons.check_rounded,
                    color: Color(0xff2B99FF),
                  )),
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
                color:
                    (index == 4) ? const Color(0xff2B99FF) : Colors.transparent,
                border: (index == 4)
                    ? null
                    : Border.all(
                        width: 2,
                        color: const Color(0xff2B99FF),
                      )),
            child: Text(
              '4',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: (index == 4) ? Colors.white : const Color(0xff2B99FF)),
            )),
      ],
    );
  }
}
