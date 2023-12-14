import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:empathi_care/view/widget/count_down_payment_widget.dart';
import 'package:empathi_care/view/widget/payment_instruction_list.dart';
import 'package:empathi_care/view/widget/upload_image_widget.dart';

class PembayaranManualScreen extends StatefulWidget {
  const PembayaranManualScreen({super.key});

  @override
  State<PembayaranManualScreen> createState() => _PembayaranManualScreenState();
}

class _PembayaranManualScreenState extends State<PembayaranManualScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Verifikasi Pembayaran",
          style: GoogleFonts.montserrat(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          const CountDown(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Setelah melakukan pembayaran, silahkan mulai chat bersama psikolog dengan mengakses halaman Riwayat chat.",
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Nomor Transaksi",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Nomor Transaksi",
                        textAlign: TextAlign.end,
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "E-mail",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "MentalHealth@gmail.com",
                        textAlign: TextAlign.end,
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Metode",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "BCA",
                        textAlign: TextAlign.end,
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Status",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Menunggu Pembayaran",
                        textAlign: TextAlign.end,
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Total Pembayaran",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )),
                    Expanded(
                        child: Text(
                      "Rp. 150.000",
                      textAlign: TextAlign.end,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )),
                  ],
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Text(
                      "Lihat rincian",
                      style: GoogleFonts.montserrat(fontSize: 12, color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const UploadImageWidget(),
                const SizedBox(height: 16),
                Text(
                  "Petunjuk Pembayaran",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 7),
                const PaymentInstructionList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
