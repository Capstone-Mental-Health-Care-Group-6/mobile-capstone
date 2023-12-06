import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatHistoryScreen extends StatelessWidget {
  const ChatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rangga S,Psi., M,Psi',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  'Tue 12:30',
                  style: GoogleFonts.montserrat(
                    color: const Color(0xff7C7C7C),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              receiptChat(context, 'Halo Budi, ada yang bisa saya bantu?'),
              senderChat(
                  'Hai dok Rangga, terima kasih atas fast responya. kebetulan saya sedang mengalami banyak masalah nih dok, saya ingin berbagi situasi saya dengan menggunakan Video Call.',
                  '',
                  context),
              receiptChat(context, 'Baik Silahkan'),
              senderChat('Video Call Berakhir 40 mins',
                  'assets/icons/video.svg', context),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text(
                  'Video Call Berakhir',
                  style: GoogleFonts.montserrat(
                    color: const Color(0xff7C7C7C),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              senderChat('Terimakasih atas bimbingannya Dok', '', context),
              receiptChat(context, 'Terimakasih Kembali'),
              receiptChat(context,
                  'Baik, jika sudah tidak ada keluhan saya tutup sesi konseling ya '),
              senderChat('Baik', '', context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 60.0,
        decoration: const BoxDecoration(
          color: Color(0xff0085FF),
        ),
        child: Text(
          'Sesi Chat Berakhir',
          style: GoogleFonts.montserrat(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget receiptChat(BuildContext context, String text) {
    return Row(
      children: [
        Image.asset(
          'assets/images/doctorsEllipse2.png',
          width: 40,
          height: 40,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.60,
          ),
          padding: const EdgeInsets.all(
            10.0,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          decoration: BoxDecoration(
            color: const Color(0xffCCE7FF),
            borderRadius: BorderRadius.circular(
              9.0,
            ),
          ),
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              fontSize: 10.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  Widget senderChat(String text, String image, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.70,
          ),
          padding: const EdgeInsets.all(
            10.0,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          decoration: BoxDecoration(
            color: const Color(0xffCCE7FF),
            borderRadius: BorderRadius.circular(
              9.0,
            ),
          ),
          child: image == 'assets/icons/video.svg'
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 36.0,
                      height: 36.0,
                      margin: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                      ),
                      child: SvgPicture.asset(
                        image,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Video Call Berakhir 40 mins',
                      style: GoogleFonts.montserrat(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                )
              : Text(
                  text,
                  style: GoogleFonts.montserrat(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Image.asset(
          'assets/images/user.png',
          width: 40,
          height: 40,
        ),
      ],
    );
  }
}
