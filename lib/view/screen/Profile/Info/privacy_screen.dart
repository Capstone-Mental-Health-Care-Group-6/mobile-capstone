import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privasi',
          style:
              GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 12, left: 18, right: 22, bottom: 35),
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff000000)),
                  children: [
                    TextSpan(
                      text:
                          'KEBIJAKAN PRIVASI\n\nPrivasi Anda adalah prioritas kami.\n\n',
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w700),
                    ),
                    const TextSpan(text: 'Kebijakan Privasi ini ("'),
                    TextSpan(
                      text: 'Kebijakan Privasi',
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w700),
                    ),
                    const TextSpan(
                        text:
                            '") menjelaskan bagaimana kami mengumpulkan, mengelola, dan melindungi informasi pribadi Anda saat Anda menggunakan layanan EmpathiCare ("Layanan"). Dengan menggunakan Layanan kami, Anda menyetujui dan tunduk pada Kebijakan Privasi ini.\n\n'),
                    TextSpan(
                      text: 'INFORMASI ANDA\n\n',
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w700),
                    ),
                    const TextSpan(
                        text:
                            'Kami mengumpulkan informasi yang relevan untuk memberikan Layanan kami, termasuk:\n\n1. Informasi Pribadi Anda: Ini mencakup nama, alamat email, dan nomor telepon yang Anda berikan saat mendaftar di Layanan kami.\n\n2. Informasi Kesehatan Pribadi Anda: Ini mencakup informasi terkait kesehatan mental, riwayat pengobatan, catatan pertemuan dengan psikolog, dan lainnya yang Anda berikan saat menggunakan Layanan kami.\n\n3. Data Operasi: Kami menggunakan teknologi seperti cookie dan log server untuk meningkatkan pengalaman pengguna Layanan, menyimpan preferensi Anda, dan mengaktifkan fungsi-fungsi tertentu.\n\n'),
                    TextSpan(
                      text: 'PENGUMPULAN DAN PENGGUNAAN INFORMASI\n\n',
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w700),
                    ),
                    const TextSpan(
                        text:
                            'Informasi yang kami kumpulkan digunakan untuk:\n\n1. Mengizinkan Anda menggunakan Layanan dan menjaga keamanan akun Anda.\n2. Menyelidiki informasi yang Anda berikan.\n3. Menangani keluhan dan pertanyaan Anda.\n4. Kepatuhan dan peraturan internal kami.\n5. Keperluan hukum yang berlaku.\n6. Memberikan penawaran layanan yang sesuai dengan Anda.\n7. Analisis data untuk evaluasi dan perbaikan Layanan kami\n\n'),
                    TextSpan(
                      text: 'PENYIMPANAN INFORMASI\n\n',
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w700),
                    ),
                    const TextSpan(
                        text:
                            'Kami menyimpan informasi pribadi Anda selama diperlukan dan sesuai dengan ketentuan hukum yang berlaku.\n\n'),
                    TextSpan(
                      text: 'KEAMANAN PENGIRIMAN DAN PENYIMPANAN\n\n',
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w700),
                    ),
                    const TextSpan(
                        text:
                            'Kami berusaha untuk menjaga keamanan informasi pribadi Anda dan telah mengambil langkah-langkah yang diperlukan untuk melindunginya. Namun, tidak ada jaminan keamanan 100%, dan Anda mengirimkan informasi atas risiko sendiri.\n\n'),
                    TextSpan(
                      text: 'TAUTAN KE SITUS WEB PIHAK KETIGA\n\n',
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w700),
                    ),
                    const TextSpan(
                        text:
                            'Layanan kami mungkin mengandung tautan ke situs web pihak ketiga. Kami tidak bertanggung jawab atas praktik privasi atau isi situs-situs web ini. Kami menganjurkan Anda untuk membaca kebijakan privasi situs-situs web tersebut.\n\n'),
                    TextSpan(
                      text: 'PERUBAHAN KEBIJAKAN PRIVASI\n\n',
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w700),
                    ),
                    const TextSpan(
                      text:
                          'Kebijakan Privasi ini dapat diubah dari waktu ke waktu. Perubahan tersebut akan diberitahukan melalui Layanan. Penggunaan Layanan secara berkelanjutan akan dianggap sebagai persetujuan terhadap perubahan tersebut.\n\n',
                    ),
                    TextSpan(
                      text: 'HUBUNGI KAMI\n\n',
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w700),
                    ),
                    const TextSpan(
                        text:
                            'Jika Anda memiliki pertanyaan atau memerlukan akses, perubahan, atau penghapusan informasi pribadi Anda, silakan hubungi kami melalui:\n\n'),
                    const TextSpan(
                        text:
                            'EmpathiCare Customer Support (Hanya melalui chat AI)\nEmail: support@empathicare.com'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
