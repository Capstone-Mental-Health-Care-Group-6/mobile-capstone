import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum EWallet { gopay, ovo, dana }

class CardMethodPayment extends StatefulWidget {
  const CardMethodPayment({super.key, required this.typeName});

  final String typeName;

  @override
  State<CardMethodPayment> createState() => _CardMethodPaymentState();
}

class _CardMethodPaymentState extends State<CardMethodPayment> {
  EWallet? _type = EWallet.dana;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: Card(
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color(0xFF959595),
            ),
            borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://karirlab-prod-bucket.s3.ap-southeast-1.amazonaws.com/files/privates/O5RgLOT0Wj9jzmf8stYL8Vg4IhFBHceJgWc8YwdW.png",
                      ),
                    ),
                    const SizedBox(
                      width: 14.0,
                    ),
                    Text(
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                        "Dana"),
                  ],
                ),
              ),
              Transform.scale(
                scale: 1.3,
                child: Radio(
                    value: EWallet.values.byName(widget.typeName),
                    groupValue: _type,
                    onChanged: (value) {
                      setState(() {
                        _type = value;
                      });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
