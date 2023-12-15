import 'package:flutter/material.dart';

class RiwayatPemesananIsnone extends StatelessWidget {
  const RiwayatPemesananIsnone({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 30, top: 15),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Riwayat Pemesanan",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    "Konsultasi online dengan dokter kami",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Oops.. Belum ada Transaksi nih!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(
                  "assets/images/Reminders-rafiki 1.png",
                  width: 300,
                  height: 300,
                ),
              ],
            ),
          ),
        ],
    );
  }
}
