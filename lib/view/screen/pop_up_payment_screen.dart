import 'package:empathi_care/utils/constant/font_family.dart';
import 'package:flutter/material.dart';

class PopUpPaymentSuccess extends StatelessWidget {
  const PopUpPaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/success.png",
              width: 200,
              height: 190.55,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Yeay Pembayaran Berhasil",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  fontFamily: MyFont.fontMontserrat),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: buttonWidth,
              height: 60,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {},
                child: const Text(
                  "Mulai Konseling",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: MyFont.fontMontserrat,
                    color: Colors.white,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: buttonWidth,
              height: 60,
              child: OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  side: MaterialStateProperty.all<BorderSide>(
                    const BorderSide(
                      color: Colors.blue,
                      width: 1.5,
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Kembali ke home",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: MyFont.fontMontserrat,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
