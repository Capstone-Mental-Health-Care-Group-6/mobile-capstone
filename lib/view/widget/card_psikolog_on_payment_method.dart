import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPsikologOnPaymentMethod extends StatefulWidget {
  const CardPsikologOnPaymentMethod({super.key});

  @override
  State<CardPsikologOnPaymentMethod> createState() =>
      _CardPsikologOnPaymentMethodState();
}

class _CardPsikologOnPaymentMethodState
    extends State<CardPsikologOnPaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
          color: Color(0xFFCCE7FF),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ListTile(
        leading: CircleAvatar(
            child: Image.asset(
          'assets/image/logo-psikolog.png',
        )),
        title: Text('Rangga S.Psi., M.Psi',
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w600)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Spesialis psikolog',
              style: GoogleFonts.montserrat(fontSize: 12),
            ),
            Text(
              'Trauma, Stress, Depresi',
              style: GoogleFonts.montserrat(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
