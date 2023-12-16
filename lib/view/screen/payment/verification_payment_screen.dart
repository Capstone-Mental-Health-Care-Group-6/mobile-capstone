import 'package:empathi_care/utils/constant/color.dart';
import 'package:empathi_care/view/screen/payment/success_verification_screen.dart';

import 'package:empathi_care/view/widget/count_down_payment_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationPaymentScreen extends StatefulWidget {
  const VerificationPaymentScreen({super.key});

  @override
  State<VerificationPaymentScreen> createState() =>
      _VerificationPaymentScreenState();
}

class _VerificationPaymentScreenState extends State<VerificationPaymentScreen> {
  @override
  void initState() {
    succes();
    super.initState();
  }

  Future<void> succes() async {
    await Future.delayed(const Duration(seconds: 10)).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const SuccessVerificationScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Verifikasi",
          style:
              GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        surfaceTintColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 317,
            child: Image(
              image: AssetImage("assets/images/menunggu_verifikasi.png"),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: ColorBase.primaryColor,
            width: double.infinity,
            child: Text(
              "Pembayaranmu sedang diperiksa dan akan selesai maks. 1 jam dalam pembelian.",
              style: GoogleFonts.montserrat(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
          const CountDown()
        ],
      ),
    );
  }
}
