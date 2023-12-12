import 'package:empathi_care/view/screen/ForgotPassword/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

class VerificationEmailScreen extends StatefulWidget {
  const VerificationEmailScreen({super.key});

  @override
  State<VerificationEmailScreen> createState() =>
      _VerificationEmailScreenState();
}

class _VerificationEmailScreenState extends State<VerificationEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verifikasi Email',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700, fontSize: 16)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: ListView(
            children: [
              Image.asset('assets/images/recruitment.png'),
              const SizedBox(height: 5),
              Text(
                'Silahkan masukkan kode OTP yang telah dikirim ke email anda',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: InputOTP(),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 45),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: const Color(0XFF0085FF),
                            foregroundColor: Colors.white),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const ChangePasswordScreen()));
                        },
                        child: Text(
                          'Konfirmasi Kode',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        )),
                  ),
                  const SizedBox(height: 12),
                  RichText(
                    overflow: TextOverflow.clip,
                    text: TextSpan(
                      style: GoogleFonts.montserrat(
                          color: const Color(0xff636363),
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
                ],
              )
            ],
          )),
    );
  }
}

class InputOTP extends StatelessWidget {
  const InputOTP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    textStyle: Theme.of(context).textTheme.displaySmall),
                decoration: const InputDecoration(border: InputBorder.none),
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
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    textStyle: Theme.of(context).textTheme.displaySmall),
                decoration: const InputDecoration(border: InputBorder.none),
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
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    textStyle: Theme.of(context).textTheme.displaySmall),
                decoration: const InputDecoration(border: InputBorder.none),
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
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    textStyle: Theme.of(context).textTheme.displaySmall),
                decoration: const InputDecoration(border: InputBorder.none),
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
    );
  }
}
