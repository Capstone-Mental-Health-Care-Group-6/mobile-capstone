import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberedText extends StatelessWidget {
  final List<String> items;

  const NumberedText({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        items.length,
        (index) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 25, // Adjust the width for your numbering
              child: Text('${index + 1}.',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: const Color(0xff070707))),
            ),
            Expanded(
              child: Text(
                items[index],
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    height: 1.2,
                    color: const Color(0xff070707)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
