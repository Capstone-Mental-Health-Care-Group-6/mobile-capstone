import 'package:empathi_care/view/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordSuccessScreen extends StatefulWidget {
  const ChangePasswordSuccessScreen({super.key});

  @override
  State<ChangePasswordSuccessScreen> createState() =>
      _ChangePasswordSuccessScreenState();
}

class _ChangePasswordSuccessScreenState
    extends State<ChangePasswordSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: const Icon(
              Icons.check_circle_rounded,
              size: 170,
              color: Color(0xff2B99FF),
            ),
          ),
          Text(
            'Berhasil!',
            style: GoogleFonts.montserrat(
                fontSize: 34, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 40),
            child: Text(
              'Password anda berhasil diperbarui',
              style: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: const Color(0XFF0085FF),
                foregroundColor: Colors.white),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginScreen()));
            },
            child: Text(
              'Ok',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700, fontSize: 16),
            )),
      ),
    );
  }
}
