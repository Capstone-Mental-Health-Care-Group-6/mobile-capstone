import 'package:dotted_line/dotted_line.dart';
import 'package:empathi_care/view/widget/card_invoice_widget.dart';
import 'package:empathi_care/view/widget/card_method_payment.dart';
import 'package:empathi_care/view/widget/card_psikolog_on_payment_method.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum EWallet { gopay, ovo, dana }

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  bool isEWallet = true;
  int? selectedPaymentMethod;
  bool isCheckTermCondition = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Metode Pembayaran',
            style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: ListView(
          children: [
            timeLine(),
            const SizedBox(height: 25),
            const CardPsikologOnPaymentMethod(),
            const SizedBox(height: 15),
            const CardInvoicePayment(),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Metode Pembayaran',
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    Text('Yuk pilih cara bayar yang kamu mau',
                        style: GoogleFonts.montserrat(fontSize: 12))
                  ],
                ),
                const SizedBox(height: 15),
                switcherPaymentMethod(),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 15),
                    CardMethodPayment(typeName: 'dana'),
                    SizedBox(height: 5),
                    CardMethodPayment(
                      typeName: 'ovo',
                    ),
                    SizedBox(height: 5),
                    CardMethodPayment(
                      typeName: 'gopay',
                    ),
                    SizedBox(height: 5),
                  ],
                ),
                Row(
                  children: [
                    Transform.scale(
                        scale: 1.3,
                        child: Checkbox(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5.0))), // Rounded Checkbox
                          value: isCheckTermCondition,
                          onChanged: (inputValue) {
                            setState(() {
                              isCheckTermCondition = inputValue!;
                            });
                          },
                        )),
                    Expanded(
                      child: RichText(
                          text: TextSpan(
                              text: 'Saya telah membaca dan menyetujui ',
                              style:
                                  GoogleFonts.montserrat(color: Colors.black),
                              children: [
                            TextSpan(
                                text: 'syarat dan ketentuan',
                                style: GoogleFonts.montserrat(
                                    color: const Color(0xFF6C8AF7)))
                          ])),
                    ),
                  ],
                ),
                const SizedBox(height: 20)
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 75,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Biaya',
                    style: GoogleFonts.montserrat(),
                  ),
                  Text('Rp 80.000',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700, fontSize: 18))
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor:
                        Colors.white, //change background color of button
                    backgroundColor:
                        const Color(0xFF0085FF), //change text color of button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 15.0),
                onPressed: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                  child: Text(
                    'Bayar Sekarang',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget switcherPaymentMethod() {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xffCCE7FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  isEWallet = true;
                  // addDataPaket();
                  selectedPaymentMethod = null;
                  setState(() {});
                },
                child: Container(
                  // padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: isEWallet
                      ? BoxDecoration(
                          color: const Color(0xff0085FF),
                          borderRadius: BorderRadius.circular(8),
                        )
                      : null,
                  child: Center(
                      child: Text(
                    "E-wallet",
                    style: GoogleFonts.montserrat(
                        color: isEWallet ? Colors.white : Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  isEWallet = false;
                  selectedPaymentMethod = null;
                  // addDataPaket();
                  setState(() {});
                },
                child: Container(
                  // padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: !isEWallet
                      ? BoxDecoration(
                          color: const Color(0xff0085FF),
                          borderRadius: BorderRadius.circular(8),
                        )
                      : null,
                  child: Center(
                      child: Text(
                    "Bank-Transfer",
                    style: GoogleFonts.montserrat(
                        color: !isEWallet ? Colors.white : Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
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

Widget timeLine() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SizedBox(
          width: double.infinity,
          // height: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
              const Expanded(
                child: DottedLine(
                  alignment: WrapAlignment.center,
                  dashColor: Colors.blue,
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
              const Expanded(
                child: DottedLine(
                  dashColor: Colors.blue,
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Paket",
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 10),
          ),
          Text(
            "Psikolog",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
          Text(
            "Bayar",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ],
      ),
    ],
  );
}
