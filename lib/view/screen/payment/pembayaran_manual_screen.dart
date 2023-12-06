import 'package:dotted_border/dotted_border.dart';
import 'package:empathi_care/view/screen/payment/verification_payment_screen.dart';
import 'package:empathi_care/view/widget/count_down_payment_widget.dart';
import 'package:empathi_care/view/widget/payment_instruction_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Expanded(
                        child: Text(
                          "Menunggu Pembayaran",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                          ),
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
                      style: GoogleFonts.montserrat(
                          fontSize: 12, color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(242, 242, 242, 1.0),
                  ),
                  alignment: Alignment.center,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(
                      8.0,
                    ),
                    dashPattern: const [4.0, 4.0],
                    child: SizedBox(
                      width: 328.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/download.svg',
                              width: 34.0,
                              height: 34.0,
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            Text(
                              'or',
                              style: GoogleFonts.roboto(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            SizedBox(
                              width: 120.0,
                              height: 40.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      8.0,
                                    ),
                                  ),
                                  backgroundColor: const Color(0xff0085FF),
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Select file',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'Recommended Image Size 300x450. Only Accept: jpg,png.jpeg.',
                              style: GoogleFonts.montserrat(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff666666),
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Upload Bukti Pembayaran",
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  "* Transaksi Anda tidak akan kami proses sebelum menekan tombol konfirmasi pembayaran",
                  style: GoogleFonts.montserrat(
                      fontSize: 10, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  "* Pastikan foto bukti transfer terbaca",
                  style: GoogleFonts.montserrat(
                      fontSize: 10, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const VerificationPaymentScreen(),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        "Konfirmasi Pembayaran",
                        style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ),
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