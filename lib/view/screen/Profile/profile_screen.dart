import 'package:empathi_care/view/screen/Profile/ChangePassword/change_password_screen.dart';
import 'package:empathi_care/view/screen/Profile/EditProfile/edit_profile_screen.dart';
import 'package:empathi_care/view/screen/Profile/Info/about_us_screen.dart';
import 'package:empathi_care/view/screen/Profile/Info/privacy_screen.dart';
import 'package:empathi_care/view/screen/Register/terms_screen.dart';
import 'package:empathi_care/view/screen/chat_bot_cs_screen.dart';
import 'package:empathi_care/view/widget/DeleteLogOutProfile/delete_widget.dart';
import 'package:empathi_care/view/widget/DeleteLogOutProfile/logout_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 40, top: 80, right: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                const SizedBox(width: 15),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tara Pramudya',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'tara1945@email.com',
                        style: GoogleFonts.montserrat(
                            fontSize: 12, fontWeight: FontWeight.w500),
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: dataProfil(context, "Ubah Kata Sandi",
                        const ChangePasswordScreen()),
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
                  buildTitleBox(
                    "Aplikasi EmpathiCare",
                  ),
                  dataProfil(context, "Tentang Kami", const AboutUsScreen()),
                  dataProfil(context, "Privasi", const PrivacyScreen()),
                  dataProfil(
                      context, "Syarat & Ketentuan", const TermsScreen()),
                  dataProfil(context, "Hubungi Kami", const ChatMenuScreen()),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, right: 10, left: 10, bottom: 8),
                    child: GestureDetector(
                      onTap: () {
                        logOutWidget(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Keluar',
                            style: GoogleFonts.montserrat(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: Color(0xFF858C94),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: () => deleteWidget(context),
              child: Container(
                height: 30,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFDCDCDC),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 4.5),
                  child: Text(
                    "Hapus Akun",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget dataProfil(BuildContext context, String text, Widget route) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 5),
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
              style: GoogleFonts.montserrat(
                  fontSize: 12, fontWeight: FontWeight.w600),
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
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
