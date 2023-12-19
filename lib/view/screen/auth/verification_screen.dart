import 'package:empathi_care/view/screen/Register/filling_profile/filling_profile_1_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key, required this.email});

  final String email;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Text(
                  'Cek Email Kamu',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600, fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 45, right: 45),
                child: Text(
                  'Masukan kode verifikasi yang sudah kami kirim melalui email ${widget.email}',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 65,
                      height: 70,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: const Color(0xffCCE7FF),
                            borderRadius: BorderRadius.circular(4)),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 11, top: 13),
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                textStyle:
                                    Theme.of(context).textTheme.displaySmall),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 65,
                      height: 70,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: const Color(0xffCCE7FF),
                            borderRadius: BorderRadius.circular(4)),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 11, top: 13),
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              } else if (value.isEmpty) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                textStyle:
                                    Theme.of(context).textTheme.displaySmall),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 65,
                      height: 70,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: const Color(0xffCCE7FF),
                            borderRadius: BorderRadius.circular(4)),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 11, top: 13),
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              } else if (value.isEmpty) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                textStyle:
                                    Theme.of(context).textTheme.displaySmall),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 65,
                      height: 70,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: const Color(0xffCCE7FF),
                            borderRadius: BorderRadius.circular(4)),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 11, top: 13),
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                              } else if (value.isEmpty) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                textStyle:
                                    Theme.of(context).textTheme.displaySmall),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: const Alignment(0, 0.96),
                child: Padding(
                  padding: const EdgeInsets.only(left: 33, right: 33, top: 36),
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
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (_) => const FillingProfile1()));
                        },
                        child: Text(
                          'Berikutnya',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700, fontSize: 14),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  overflow: TextOverflow.clip,
                  text: TextSpan(
                    style: GoogleFonts.roboto(
                        color: const Color(0xffBBA9A9),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.6),
                    children: [
                      const TextSpan(text: 'Tidak menerima kode?'),
                      TextSpan(
                        text: ' Kirim Ulang',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Feedback.forTap(context);
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
