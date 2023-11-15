import 'package:flutter/material.dart';

class CardPaketWidget extends StatefulWidget {
  const CardPaketWidget({super.key});

  @override
  State<CardPaketWidget> createState() => _CardPaketWidgetState();
}

class _CardPaketWidgetState extends State<CardPaketWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(color: Color(0xffCCE7FF), borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(9))),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    // image: DecorationImage(image: AssetImage()),
                  ),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Paket Perkenalan",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Rp. 80.000/1 Sesi",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Metode Chat",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 4),
                Text(
                  "Durasi 30 Menit",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
