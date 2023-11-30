import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeLine extends StatelessWidget {
  const TimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SizedBox(
            width: double.infinity,
            // height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: DottedLine(
                    alignment: WrapAlignment.center,
                    dashColor: Colors.grey.withOpacity(0.4),
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: DottedLine(
                    dashColor: Colors.grey.withOpacity(0.4),
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Paket",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            Text(
              "Psikolog",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            Text(
              "Bayar",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.grey.withOpacity(0.4),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
