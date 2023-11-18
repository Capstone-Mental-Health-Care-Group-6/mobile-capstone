import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonClockWidget extends StatelessWidget {
  ButtonClockWidget({super.key});

  final List<String> textSlot = [
    "09.30 - 10.00",
    "13.30 - 14.00",
    "15.30 - 16.00",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: textSlot.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(
        right: 12.0,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        childAspectRatio: 2.5 / 1,
      ),
      itemBuilder: (context, index) {
        final textClock = textSlot[index];
        return GestureDetector(
          onTap: () {},
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                color: const Color(0xffCCE7FF),
              ),
              child: Center(
                child: Text(
                  textClock,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    fontSize: 10.0,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
