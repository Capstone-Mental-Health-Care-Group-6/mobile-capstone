import 'package:empathi_care/view/screen/Profile/ChangePassword/change_password_screen.dart';
import 'package:empathi_care/view/screen/Profile/EditProfile/edit_profile_screen.dart';
import 'package:empathi_care/view/screen/Profile/Info/about_us_screen.dart';
import 'package:empathi_care/view/screen/Profile/Info/privacy_screen.dart';
import 'package:empathi_care/view/screen/Register/terms_screen.dart';
import 'package:empathi_care/view/screen/chat_bot_cs_screen.dart';
import 'package:empathi_care/view/screen/home_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                dataProfil(context, "Edit Profil", const EditProfile()),
                dataProfil(context, "Ubah Kata Sandi", const ChangePasswordScreen()),
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 10),
                //   child: dataProfil(
                //       context, "Ubah PIN EmpathiCare", const ChatMenuScreen()),
                // ),
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
                buildTitleBox(
                  "Aplikasi EmpathiCare",
                ),
                dataProfil(context, "Tentang Kami", const AboutUsScreen()),
                dataProfil(context, "Privasi", const PrivacyScreen()),
                dataProfil(
                    context, "Syarat & Ketentuan", const TermsScreen()),
                dataProfil(context, "Hubungi Kami", const ChatMenuScreen()),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: dataProfil(context, "Keluar", const HomeScreen()),
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

  Widget dataProfil(BuildContext context, String text, Widget route) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => route),
          );
        },
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