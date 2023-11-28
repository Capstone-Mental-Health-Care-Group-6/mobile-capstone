import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CardReview extends StatefulWidget {
  const CardReview({super.key});

  @override
  State<CardReview> createState() => _CardReviewState();
}

class _CardReviewState extends State<CardReview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFCCE7FF),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            // height: 100,
            child: ListTile(
                leading: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/profile-reviewer.png',
                          )),
                    )),
                title: Text('Naufal Rafi Shafghani',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600, fontSize: 14)),
                subtitle: Text(
                  '2 hari lalu',
                  style: GoogleFonts.montserrat(
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
                trailing: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 5,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/star.svg',
                      color: const Color(0xFFFFBB00),
                      width: 20,
                    ),
                    Text(
                      '5',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    )
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: Text(
              'Dokter sangat hebat! Terima kasih telah memberi saya saran yang luar biasa dan telah membantu saya melalui masalah yang sangat berat. Terima kasih dok.',
              style: GoogleFonts.montserrat(
                  fontSize: 12, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
