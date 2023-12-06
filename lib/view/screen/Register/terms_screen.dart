import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Syarat & Ketentuan',
          style:
              GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(right: 20, left: 20, bottom: 35, top: 12),
          child: Column(
            children: [
              Text(
                'Selamat datang di EmpathiCare.\n\nSebelum Anda melanjutkan untuk menggunakan layanan kami, kami sangat menyarankan Anda untuk membaca dan memahami syarat dan ketentuan berikut ini. Dengan mengakses dan menggunakan aplikasi ini, Anda setuju untuk terikat oleh syarat dan ketentuan ini. Jika Anda tidak setuju dengan syarat dan ketentuan ini, mohon untuk tidak menggunakan aplikasi kami.\n\nPenggunaan Informasi: Kami menyediakan layanan konsultasi dengan psikolog melalui chat, video call, dan zoom call. Informasi yang Anda berikan selama konsultasi akan dianggap rahasia, kecuali dalam kasus yang diwajibkan oleh hukum atau kebijakan perusahaan kami.\nBatasan Layanan: Layanan konsultasi dengan psikolog adalah sarana pendukung dan bukan pengganti konsultasi medis langsung. Kami tidak bertanggung jawab atas hasil dari konsultasi yang dilakukan.\nKetersediaan Layanan: Layanan kami mungkin tidak selalu tersedia 24/7. Kami akan berusaha sebaik mungkin untuk memberikan layanan secepat mungkin, tetapi kami tidak menjamin ketersediaan konsultasi dalam waktu tertentu.\nPendaftaran: Anda bertanggung jawab untuk memberikan informasi pendaftaran yang akurat dan terbaru. Anda tidak boleh memberikan informasi palsu atau mengambil identitas orang lain.\nTindakan Pengguna: Anda setuju untuk tidak menggunakan aplikasi ini untuk tujuan ilegal atau melanggar hukum.\nKonten Aplikasi: Aplikasi ini dapat berisi artikel kesehatan mental yang bertujuan untuk memberikan informasi umum. Artikel ini tidak menggantikan saran medis atau konsultasi dengan seorang profesional kesehatan mental.\nPrivasi: Kami menghormati privasi Anda. Informasi pribadi yang Anda berikan akan dikelola sesuai dengan kebijakan privasi kami.\nKeamanan Akun: Anda bertanggung jawab atas keamanan akun Anda. Jangan memberikan informasi login Anda kepada orang lain.\nPembaruan Syarat dan Ketentuan: Kami berhak untuk memperbaiki atau mengubah syarat dan ketentuan ini dari waktu ke waktu. Perubahan tersebut akan diberitahukan kepada Anda melalui aplikasi atau email.\nPengakhiran Akun: Kami berhak untuk mengakhiri akun pengguna tanpa pemberitahuan jika Anda melanggar syarat dan ketentuan ini.\n\nDengan menggunakan aplikasi ini, Anda setuju untuk mematuhi syarat dan ketentuan ini. Mohon diingat bahwa ini hanyalah contoh, dan Anda sebaiknya berkonsultasi dengan seorang profesional hukum untuk memastikan bahwa syarat dan ketentuan tersebut sesuai dengan hukum yang berlaku di wilayah Anda.',
                style: GoogleFonts.montserrat(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
