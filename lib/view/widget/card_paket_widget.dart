import 'package:flutter/material.dart';

Widget CardPaketWidget({required String title, required String price, required List profit}) {
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
                  // color: Colors.grey,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/icons/icons_paket.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    price,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: profit.length,
                itemBuilder: (context, index) {
                  return Text(
                    "\u2022 ${profit[index].toString()}",
                    style: const TextStyle(fontSize: 14),
                  );
                },
              )
            ],
          ),
        )
      ],
    ),
  );
}
