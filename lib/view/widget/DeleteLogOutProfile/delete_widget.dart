import 'package:empathi_care/view/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

deleteWidget(BuildContext context) {
  return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      context: context,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Hapus Akun EmpathiCare',
                  style: GoogleFonts.montserrat(
                      fontSize: 14, fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16, left: 28.5, right: 28.5),
                  child: Text(
                    'Apakah Anda yakin untuk menghapus Akun? Dengan menghapus akun EmpathiCare, Anda akan kehilangan seluruh layanan EmpathiCare yang bermanfaat dan\nmenarik untuk Anda.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(140, 35),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: const Color(0XFF0085FF),
                            foregroundColor:
                                const Color.fromRGBO(255, 255, 255, 1)),
                        child: const Text('Batal'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0XFF0085FF)),
                            minimumSize: const Size(140, 35),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.transparent,
                            foregroundColor: const Color(0XFF0085FF),
                          ),
                          child: const Text('Ya, Hapus'),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => const LoginScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
