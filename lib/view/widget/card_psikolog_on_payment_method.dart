import 'package:empathi_care/view_model/profile_psikolog_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
    final profilePsikologViewModel =
        Provider.of<ProfilePsikologProvider>(context, listen: false);

    String getDoctorExpertise(int expertiseId) {
      switch (expertiseId) {
        case 1:
          return 'Masalah Emosi';
        case 2:
          return 'Parenting';
        case 3:
          return 'Masalah Diri';
        case 4:
          return 'Keluarga';
        case 5:
          return 'Remaja dan Anak-anak';
        case 6:
          return 'Hubungan';
        default:
          return 'Lainnya';
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
          color: Color(0xFFCCE7FF),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ListTile(
        leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      profilePsikologViewModel.dataDoctor['doctor_avatar'])),
            )),
        title: Text(profilePsikologViewModel.dataDoctor['doctor_name'],
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w700)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Spesialis Psikolog',
              style: GoogleFonts.montserrat(fontSize: 12),
            ),
            Text(
              getDoctorExpertise(
                  profilePsikologViewModel.dataDoctor['expertise_id']),
              style: GoogleFonts.montserrat(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
