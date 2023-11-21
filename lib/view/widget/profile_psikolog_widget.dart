import 'package:empathi_care/view/widget/button_clock_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePsikologWidget extends StatelessWidget {
  const ProfilePsikologWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: const Color(0xff000000).withOpacity(0.25),
        title: Text(
          'Profile Psikolog',
          style: GoogleFonts.montserrat(
            fontSize: 16.0,
            color: const Color(0xff393938),
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: const Icon(Icons.arrow_back),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 140.0,
            color: const Color(0xffCCE7FF),
            child: Image.asset(
              'assets/doctors.png',
              width: 50,
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              30.0,
              20.0,
              30.0,
              10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Rangga S.Psi., M.Psi',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(
                      width: 100.0,
                    ),
                    Image.asset('assets/star.png'),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '4.8',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Therapy, positive psychology',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 10.0,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Tentang',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Dr. Rangga S adalah seorang profesional psikologi yang berpengalaman dengan latar belakang pendidikan yang kuat, memegang gelar Sarjana Psikologi (S.Psi) dan Magister Psikologi (M.Psi). Dengan lebih dari sepuluh tahun pengalaman praktik, Dr. Rangga telah menjadi seorang ahli dalam konseling keluarga dan terapi individu. ',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 10.0,
                    color: const Color(0xff323232),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jadwal yang tersedia',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      '3 Jadwal Tersedia',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                ButtonClockWidget(),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Nomer izin Praktik',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  'SIPP : 3232323232 ',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 10.0,
                    color: const Color(0xff323232),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
