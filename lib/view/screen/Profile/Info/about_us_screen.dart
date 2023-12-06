import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tentang EmpathiCare',
          style:
              GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(children: [
          Image.asset(
            'assets/images/About_Us.png',
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 35),
            child: Text(
                'EmpathiCare: Solusi Kesehatan Mental Anda\n\nEmpathiCare adalah platform kesehatan mental yang dirancang untuk membantu Anda mengelola stres dan kecemasan, berkonsultasi dengan psikolog atau spesialis kesehatan mental, serta mendapatkan informasi terpercaya tentang kesehatan mental. Kami mengutamakan kesehatan mental Anda dan berkomitmen untuk memberikan layanan terbaik.\n\nMengatasi Tantangan Kesehatan Mental\n\nDalam dunia yang penuh dengan tekanan dan kecemasan, akses terhadap perawatan kesehatan mental seringkali terbatas. EmpathiCare hadir sebagai solusi untuk menangani masalah ini:\n\n1. Akses Mudah ke Layanan Kesehatan Mental: Kami menyediakan akses mudah untuk berkonsultasi dengan psikolog dan spesialis kesehatan mental berpengalaman. Anda dapat berbicara langsung dengan mereka melalui aplikasi kami.\n\n2. Pemberantasan Diskriminasi: Kami memahami bahwa gangguan kesehatan mental seringkali dihadapi dengan diskriminasi. EmpathiCare adalah tempat yang aman dan bebas dari stigmatisasi untuk mendiskusikan masalah kesehatan mental Anda.\n\n3. Sumber Daya yang Berkualitas: Kami menyediakan informasi berkualitas tentang kesehatan mental yang dapat membantu Anda memahami kondisi Anda dan mengambil langkah-langkah yang tepat.\n\n4. Meningkatkan Kesadaran Publik: Kami berkomitmen untuk meningkatkan kesadaran publik tentang kesehatan mental. Kami percaya bahwa pengetahuan adalah kunci untuk mengatasi stigma dan meningkatkan perhatian terhadap kesehatan mental.\n\nMitra Dokter dan Psikolog\n\nKami bekerja sama dengan dokter dan psikolog terpercaya untuk memberikan saran dan dukungan kepada Anda. Mereka siap membantu Anda dalam mengatasi tantangan kesehatan mental yang Anda hadapi.\n\nEmpathiCare adalah solusi yang komprehensif untuk kesehatan mental Anda. Kami berusaha untuk terus mengembangkan layanan kami demi memenuhi kebutuhan masyarakat dan mendukung kemajuan kesehatan mental di masyarakat.',
                style: GoogleFonts.montserrat(
                    fontSize: 12, fontWeight: FontWeight.w500)),
          )
        ]),
      )),
    );
  }
}
