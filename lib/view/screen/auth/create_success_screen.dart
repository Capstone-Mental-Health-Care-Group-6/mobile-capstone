import 'package:empathi_care/view/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateSuccessAccountScreen extends StatefulWidget {
  const CreateSuccessAccountScreen({super.key});

  @override
  State<CreateSuccessAccountScreen> createState() =>
      _CreateSuccessAccountScreenState();
}

class _CreateSuccessAccountScreenState
    extends State<CreateSuccessAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 200),
            alignment: Alignment.center,
            child: const Icon(
              Icons.check_circle,
              size: 170,
              color: Color(0xff2B99FF),
            ),
          ),
          Text(
            'Sukses Buat Akun!',
            style: GoogleFonts.montserrat(
                fontSize: 22, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              ' Silahkan untuk masuk kembali ya.',
              style: GoogleFonts.montserrat(
                  fontSize: 11, fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.96),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 12),
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: Color.fromRGBO(0, 0, 0, 0.20),
                      offset: Offset(0, 4))
                ]),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(130, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: const Color(0XFF0085FF),
                        foregroundColor: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const LoginScreen()));
                    },
                    child: Text(
                      'OK',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700, fontSize: 14),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
