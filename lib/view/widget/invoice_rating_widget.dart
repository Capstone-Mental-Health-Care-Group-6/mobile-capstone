import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InvoiceRatingWidget extends StatelessWidget {
  const InvoiceRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        8.0,
      ),
      width: MediaQuery.of(context).size.width,
      height: 420.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12.0,
        ),
        color: const Color(0xffCCE7FF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/doctorEllipse.png'),
              const SizedBox(
                width: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rangga S.Psi., M.Psi',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Spesialis Psikolog',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.0,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Divider(
            color: const Color(0xff0085FF).withAlpha(50),
            thickness: 1.0,
            endIndent: 10.0,
            indent: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
            ),
            child: Text(
              'Feedback',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 12.0,
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
            ),
            child: Text(
              'Sangat Membantu dan membuat saya lebih bersemangat!',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                fontSize: 10.0,
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Divider(
            color: const Color(0xff0085FF).withAlpha(50),
            thickness: 1.0,
            endIndent: 10.0,
            indent: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
            ),
            child: Text(
              'Detail Pemesanan',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 10.0,
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Paket Chat Psikolog',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.0,
                  ),
                ),
                Text(
                  'Instant',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Topik',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.0,
                  ),
                ),
                Text(
                  'Stress',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Divider(
            color: const Color(0xff0085FF).withAlpha(50),
            thickness: 1.0,
            endIndent: 10.0,
            indent: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
            ),
            child: Text(
              'Detail Pembayaran',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 10.0,
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Biaya Konsultasi',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.0,
                  ),
                ),
                Text(
                  '50.000',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pajak',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.0,
                  ),
                ),
                Text(
                  '5.000',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Diskon Voucher',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.0,
                  ),
                ),
                Text(
                  '-10.000',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Divider(
            color: const Color(0xff0085FF).withAlpha(50),
            thickness: 1.0,
            endIndent: 10.0,
            indent: 10.0,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Harga',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 10.0,
                  ),
                ),
                Text(
                  '45.000',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: const Color(0xff0085FF).withAlpha(50),
            thickness: 1.0,
            endIndent: 10.0,
            indent: 10.0,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bayar melalui OVO',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 10.0,
                  ),
                ),
                Text(
                  '45.000',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
