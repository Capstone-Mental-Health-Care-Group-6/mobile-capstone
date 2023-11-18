import 'package:empathi_care/utils/constant/color.dart';
import 'package:empathi_care/utils/constant/font_family.dart';
import 'package:empathi_care/view_model/count_down_payment_success_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountDown extends StatefulWidget {
  const CountDown({Key? key}) : super(key: key);

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  @override
  void initState() {
    super.initState();
    Provider.of<CountDownPaymentSuccessProvider>(context, listen: false)
        .countDown();
  }

  @override
  Widget build(BuildContext context) {
    final countdownProvider =
        Provider.of<CountDownPaymentSuccessProvider>(context);

    return Column(
      children: [
        Container(
          color: ColorBase.primaryColor,
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const CountdownDisplay(),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Center(
                  child: Text(
                    'Sebelum ${countdownProvider.formattedDate}, ${countdownProvider.formattedStartTime} WIB',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontFamily: MyFont.fontMontserrat,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CountdownDisplay extends StatelessWidget {
  const CountdownDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countdownProvider =
        Provider.of<CountDownPaymentSuccessProvider>(context);
    final timeLeft = countdownProvider.timeLeft;

    return timeLeft.inSeconds <= 0
        ? const Text(
            'Waktu pembayaran habis',
            style: TextStyle(fontSize: 30, fontFamily: MyFont.fontMontserrat),
          )
        : RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '${timeLeft.inMinutes.remainder(60)}',
                  style: const TextStyle(
                    fontSize: 25,
                    fontFamily: MyFont.fontMontserrat,
                  ),
                ),
                const TextSpan(
                  text: ' Menit  ',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: MyFont.fontMontserrat,
                  ),
                ),
                TextSpan(
                  text: '${timeLeft.inSeconds.remainder(60)}',
                  style: const TextStyle(
                    fontSize: 25,
                    fontFamily: MyFont.fontMontserrat,
                  ),
                ),
                const TextSpan(
                  text: ' detik',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: MyFont.fontMontserrat,
                  ),
                ),
              ],
            ),
          );
  }
}
