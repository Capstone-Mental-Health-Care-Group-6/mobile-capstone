import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 40, top: 80, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              SizedBox(width: 15),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tara Pramudya',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'tara1945@email.com',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitleBox("Akun"),
                dataProfil("Edit Profil"),
                dataProfil("Ubah Kata Sandi"),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: dataProfil("Ubah PIN EmpathiCare"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitleBox("Aplikasi EmpathiCare"),
                dataProfil("Privasi"),
                dataProfil("Syarat & Ketentuan"),
                dataProfil("Hubungi Kami"),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: dataProfil("Keluar"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Container(
            height: 30,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFDCDCDC),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 10, top: 4.5),
              child: Text(
                "Hapus Akun",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget dataProfil(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Color(0xFF858C94),
          ),
        ],
      ),
    );
  }

  Widget buildTitleBox(String title) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Color(0xFF0085FF),
      ),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.only(top: 12, left: 2),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
