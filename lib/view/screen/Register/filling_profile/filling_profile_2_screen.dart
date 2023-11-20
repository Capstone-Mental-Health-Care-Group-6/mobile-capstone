import 'package:empathi_care/view/screen/Register/filling_profile/filling_profile_3_screen.dart';
import 'package:empathi_care/view/widget/timeline/timeline2_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class FillingProfile2 extends StatefulWidget {
  const FillingProfile2({super.key});

  @override
  State<FillingProfile2> createState() => _FillingProfile1State();
}

class _FillingProfile1State extends State<FillingProfile2> {
  final namaLengkap = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 13),
            child: Text(
              'Batal',
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: const Color(0xff000000)),
            ),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TimeLine2(),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 25),
              child: Text(
                'Berapa nomor ponselmu?',
                style: GoogleFonts.montserrat(
                    fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 20, right: 25),
              child: TextFormField(
                controller: namaLengkap,
                keyboardType: TextInputType.emailAddress,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.phone,
                        size: 24,
                        color: Color(0xff636363),
                      ),
                    ),
                    label: Text('Nomor Ponsel')),
                style: GoogleFonts.montserrat(
                    fontSize: 15, fontWeight: FontWeight.w500),
                validator: (value) {
                  if (value! == '') {
                    return 'Nomor Telepon Masih Kosong';
                  } else {
                    return null;
                  }
                },
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
                          minimumSize: const Size(370, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: const Color(0XFF0085FF),
                          foregroundColor: Colors.white),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const FillingProfile3()));
                        }
                      },
                      child: Text(
                        'Selanjutnya',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
