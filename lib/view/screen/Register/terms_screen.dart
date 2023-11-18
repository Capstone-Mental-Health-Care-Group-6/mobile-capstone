import 'package:empathi_care/view/widget/syarat_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> syarat = [
      'Penggunaan Informasi: Kami menyediakan layanan konsultasi dengan psikolog melalui chat, video call, dan zoom call. Informasi yang Anda berikan selama konsultasi akan dianggap rahasia, kecuali dalam kasus yang diwajibkan oleh hukum atau kebijakan perusahaan kami.',
      'Batasan Layanan: Layanan konsultasi dengan psikolog adalah sarana pendukung dan bukan pengganti konsultasi medis langsung. Kami tidak bertanggung jawab atas hasil dari konsultasi yang dilakukan.',
      'Ketersediaan Layanan: Layanan kami mungkin tidak selalu tersedia 24/7. Kami akan berusaha sebaik mungkin untuk memberikan layanan secepat mungkin, tetapi kami tidak menjamin ketersediaan konsultasi dalam waktu tertentu.',
      'Pendaftaran: Anda bertanggung jawab untuk memberikan informasi pendaftaran yang akurat dan terbaru. Anda tidak boleh memberikan informasi palsu atau mengambil identitas orang lain.',
      'Tindakan Pengguna: Anda setuju untuk tidak menggunakan aplikasi ini untuk tujuan ilegal atau melanggar hukum.',
      'Konten Aplikasi: Aplikasi ini dapat berisi artikel kesehatan mental yang bertujuan untuk memberikan informasi umum. Artikel ini tidak menggantikan saran medis atau konsultasi dengan seorang profesional kesehatan mental.',
      'Privasi: Kami menghormati privasi Anda. Informasi pribadi yang Anda berikan akan dikelola sesuai dengan kebijakan privasi kami.',
      'Keamanan Akun: Anda bertanggung jawab atas keamanan akun Anda. Jangan memberikan informasi login Anda kepada orang lain.',
      'Pembaruan Syarat dan Ketentuan: Kami berhak untuk memperbarui atau mengubah syarat dan ketentuan ini dari waktu ke waktu. Perubahan tersebut akan diberitahukan kepada Anda melalui aplikasi atau email.',
      'Pengakhiran Akun: Kami berhak untuk mengakhiri akun pengguna tanpa pemberitahuan jika Anda melanggar syarat dan ketentuan ini.'
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: ListView(
          children: [
            Text(
              'Syarat & Ketentuan',
              style: GoogleFonts.montserrat(
                  fontSize: 24, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '\nDengan mengakses dan menggunakan aplikasi ini, Anda setuju untuk terikat oleh syarat dan ketentuan ini. Jika Anda tidak setuju dengan syarat dan ketentuan ini, mohon untuk tidak menggunakan aplikasi kami.\n',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    height: 1.2,
                    color: const Color(0xff070707)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: NumberedText(items: syarat),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 50),
              child: Text(
                '\nDengan menggunakan aplikasi ini, Anda setuju untuk mematuhi syarat dan ketentuan ini. Mohon diingat bahwa ini hanyalah contoh, dan Anda sebaiknya berkonsultasi dengan seorang profesional hukum untuk memastikan bahwa syarat dan ketentuan tersebut sesuai dengan hukum yang berlaku di wilayah Anda.',
                style: GoogleFonts.montserrat(
                    fontSize: 18, fontWeight: FontWeight.w500, height: 1.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
